#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "fir.h"
#include "hal.h"

#ifdef CUSTOM_MAIN

int16_t samples_in[BUFFER_LEN];

int16_t coeffs[FILTER_LEN] = {-1468, 1058, 594, 287, 186, 284, 485, 613, 495, 90, -435, -762, -615, 21, 821, 1269, 982, 9, -1132, -1721, -1296, 1, 1445, 2136, 1570, 0, -1666, -2413, -1735, -2, 1770, 2512, 1770, -2, -1735, -2413, -1666, 0, 1570, 2136, 1445, 1, -1296, -1721, -1132, 9, 982, 1269, 821, 21, -615, -762, -435, 90, 495, 613, 485, 284, 186, 287, 594, 1058, -1468};

extern unsigned long long int get_ticks();
int _main_fir();

#ifdef ALL_BENCHMARKS
double _fir()
#else
int main(int argc, char *argv[])
#endif
{
	unsigned long long int t1,t2;

    t1 = get_ticks();
    _main_fir();
    t2 = get_ticks();
    printf("----------------------------------------------------------\r\n");
    printf("FIR took %'.6lf million clock cycles\r\n",(t2-t1)/1000000.0);
    printf("----------------------------------------------------------\r\n");
#ifdef ALL_BENCHMARKS
    return (t2-t1)/1000000.0;
#else
    printf("%c\n",0xFE); // Signal termination to board server
    return 0;
#endif
}

void printArr(int16_t arr[], int size, int pozStart) {

	for (int i=pozStart; i<pozStart+size; i++)
			printf("%d, ", arr[i]);
	printf("\n\n\n");
}

void FIRinit() {
	memset(samples_in, 0, sizeof(samples_in));
}

void FIR(int16_t *coeffs, int16_t *input, int16_t *output, int length, int filterLength ) {
	int32_t acc;     // accumulator 
	int16_t *coeffp; // pointer to coefficients
	int16_t *inputp; // pointer to input samples
	
	// put the new samples at the high end of the buffer
	memcpy(&samples_in[filterLength - 1], input, length * sizeof(int16_t));
	// apply the filter to each input sample
	for (int n = 0; n < length; n++) {
		// calculate output n
		coeffp = coeffs;
		inputp = &samples_in[filterLength - 1 + n];
		// load rounding constant
		acc = 1 << 14;
		// perform the multiply-accumulate
		for (int k = 0; k < filterLength; k++) {
			acc = acc + (int32_t)(*coeffp++) * (int32_t)(*inputp--);
			// saturate the result
			if ( acc > 0x3fffffff ) {
				acc = 0x3fffffff;
			} else if ( acc < -0x40000000 ) {
				acc = -0x40000000;
			}
		}
		// convert from Q30 to Q15
		output[n] = (int16_t)(acc >> 15);
	}
	// shift input samples back in time for next time
	memmove(&samples_in[0], &samples_in[length], (filterLength - 1) * sizeof(int16_t));
}


int _main_fir()
#else
int main()
#endif
{
	int error = 0;
	int16_t input[SAMPLES];
	int16_t output[SAMPLES];

	printf("Starting FIR!\r\n");

	srand(1);

	// generate input samples
	for (int i=0; i<SAMPLES; i++)
		input[i] = rand();

	// initialize the filter
	FIRinit();	
		
	// apply the filter
	FIR(coeffs, input, output, SAMPLES, FILTER_LEN);

	// check results
	for (int i=0; i<SAMPLES; i++) 
		if (output[i] != out_golden[i]) error = 1;

	if (!error) printf("CORRECT!\r\n\r\n");
	else printf("ERROR: Wrong result\r\n\r\n");

	return 0;
}
