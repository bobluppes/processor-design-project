#include <stdio.h>

#define BENCHMARKS      9

typedef void (*FuncPtr)(void);

extern unsigned long long int get_ticks();
extern double _cjpeg();
extern double _pi();
extern double _divide();
extern double _multiply();
extern double _fir();
extern double _rsa();
extern double _ssd();
extern double _ssearch();
extern double _susan();

int main(int argc, char *argv[])
{
    int i;
	double times[BENCHMARKS], total=0;
    char *bench_name[BENCHMARKS]={
        "ssd",
        "cjpeg",
        "ssearch",
        "pi",
        "susan",
        "multiply",
        "divide",
        "fir",
        "rsa"
    };
//    FuncPtr   bench_func[BENCHMARKS] = {
//        _cjpeg(),
//        _pi(),
//        _divide(),
//        _multiply(),
//        _rsa(),
//        _ssd(),
//        _ssearch(),
//        _susan() };
    
//    for (i=0;i<BENCHMARKS; i++)
//        times[i] = bench_func[i];
    times[0]=_ssd();
    times[1]=_cjpeg();
    times[2]=_ssearch();
    times[3]=_pi();
    times[4]=_susan();
    times[5]=_multiply();
    times[6]=_divide();
    times[7]=_fir();
    times[8]=_rsa();
    //remove("/Lenna192.smoothing.pgm");
    //remove("/Lenna192golden.pgm");
    //remove("/Lenna192.pgm");    
    //remove("/Lenna160.jpg");
    //remove("/Lenna160golden.jpg");
    //remove("/Lenna160.ppm"); 

/*    times[0]=432.434;
    times[1]=3245.23;
    times[2]=2;
*/
    

    printf("\r\n==========================================================\r\n");        
    printf("  Million clock cycles:");        
    printf("\r\n----------------------------------------------------------\r\n");        
    for (i=0;i<BENCHMARKS; i++) {
        printf("   %-12s %11.6lf\r\n", bench_name[i], times[i] );
        total += times[i];
    }
    printf("\r\n----------------------------------------------------------\r\n");        
    printf("   Total:       %11.6lf\r\n%c\r\n", total , 0xFE);        
    return 0;
}
