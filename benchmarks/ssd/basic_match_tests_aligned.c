
/*
 *
 * File: basic_match_tests.cpp
 *
 * Basic_match_tests tests.
 * Computes distance between two images' descriptors, as d = Sum[(xi - xj)^2 +(yi-yj)^2 ...]
 *
 *
 */
//#include "utils.h"
#include <stdlib.h>
#include <stdio.h>

#ifndef UINT8
#define UINT8 unsigned char
#endif

#ifndef UINT16
#define UINT16 unsigned short int
#endif

#ifndef INT16
#define INT16 short int
#endif

#ifndef UINT32
#define UINT32 unsigned int
#endif

#ifndef INT32
#define INT32  int
#endif


/* About descriptor file:

In the most simple form sift takes an image in PGM format and computes its SIFT keypoints and the relative descriptors,
producing a ‘.key’ ASCII file. This file has one line per keypoint, with the x and y coordinates (pixels), the scale (pixels),
the orientation (radians) and 128 numbers (in the range 0-255) representing the descriptor.
This file is almost equivalent to the output of D. Lowe’s original implementation, except that x and y are swapped
and the orientation is negated due to a different choice of the image coordinate system. --floating-point can be used
to save full floating point descriptors instead of integer descriptors.
*/

#define FEATURES_PER_DESCRIPTOR 128
#define MAX_DESCRIPTORS 16384
#define MAX_MATCHES (100*1000)
#define MAX_REDUCES (64*1024* 1024)

typedef struct
{
    float X;
    float Y;
    float Scale;
    float Orientation;
} SiftDescriptor;

typedef struct
{
    SiftDescriptor SD[MAX_DESCRIPTORS];
    UINT8 SiftDescriptorsBasicFeatures[MAX_DESCRIPTORS][FEATURES_PER_DESCRIPTOR];
    UINT16 RealDescriptors;
} SiftDescriptors;

typedef struct
{
    //DescriptorIndexInSecondImage
    UINT32 DescIx2ndImgMin[MAX_MATCHES];
    UINT32 DescIx2ndImgNextToMin[MAX_MATCHES];
    UINT32 ScoreMin[MAX_MATCHES];
    UINT32 ScoreNextToMin[MAX_MATCHES];
    UINT16 RealMatches;
} SiftMatches;

/*static void PrintDescriptors(SiftDescriptors *SDs)
{
    int DescriptorIndex=0, FeatIndex;
    for(DescriptorIndex =0; DescriptorIndex < SDs->RealDescriptors; DescriptorIndex++)
    //for(DescriptorIndex =0; DescriptorIndex < 2; DescriptorIndex++)
    {
        printf("SDs[%d]->SD.X = %f\n",DescriptorIndex,SDs->SD[DescriptorIndex].X);
        printf("SDs[%d]->SD.Y = %f\n",DescriptorIndex,SDs->SD[DescriptorIndex].Y);
        printf("SDs[%d]->SD.S = %f\n",DescriptorIndex,SDs->SD[DescriptorIndex].Scale);
        printf("SDs[%d]->SD.O = %f\n",DescriptorIndex,SDs->SD[DescriptorIndex].Orientation);

        for (FeatIndex = 0; FeatIndex < FEATURES_PER_DESCRIPTOR; FeatIndex++)
        //for (FeatIndex = 0; FeatIndex < 1; FeatIndex++)
            printf("SDs[%d]->SD.BasicFeatures[%d] = %d \n",
                   DescriptorIndex,
                   FeatIndex,
                   SDs->SiftDescriptorsBasicFeatures[DescriptorIndex][FeatIndex]);
    }
}*/

int LoadDescriptors(char *FileName, SiftDescriptors *SDs, int Limit)
{
    FILE *fp;
    if((fp = fopen(FileName, "r")) == NULL)
    {
        printf("No such file\n");
        exit(1);
    }
    else
    {
        int FeatIndex;
        int DescriptorIndex=0;
        int result;
        SDs->RealDescriptors = 0;

        while(1)
        {
            fscanf(fp,"%f",&SDs->SD[DescriptorIndex].X);
            fscanf(fp,"%f",&SDs->SD[DescriptorIndex].Y);
            fscanf(fp,"%f",&SDs->SD[DescriptorIndex].Scale);
            fscanf(fp,"%f",&SDs->SD[DescriptorIndex].Orientation);

            unsigned int a;
            for (FeatIndex = 0; FeatIndex < FEATURES_PER_DESCRIPTOR; FeatIndex++)
            {
                result = fscanf(fp,"%d",&a);
                SDs->SiftDescriptorsBasicFeatures[DescriptorIndex][FeatIndex] = a;
            }

            if (result == 1) SDs->RealDescriptors++;
            else
                {
                    fclose(fp);
                    //printf("Reached end of file\n");
                    //printf("Loading of all %d descriptors\n", SDs->RealDescriptors);
                    return 0;
                }

            DescriptorIndex++;
            if (Limit !=0)
                if (DescriptorIndex == Limit)
                {
                    fclose(fp);
                    //printf("Reached end of file\n");
//                     printf("LimitLoading of %d descriptors took = %d ms \n", Limit,GetMilliSpan(Start));
                    return 0;
                }
        }
    }
}


#define FACTOR1 46
#define FACTOR2 7 // that is (1 << 7)

/* We have to compare x/y with 0.36 ; if it is less, we have a true match

x/y < 0.36 is eqv with x < 0.36*y
0.36*y ~ 0.359375 *y = ((46 * y) >> 7) = (FACTOR1 * y) >> FACTOR2

*/
void FindMatches(SiftDescriptors *SDs1, SiftDescriptors *SDs2, SiftMatches* SMs)
{
    SMs->RealMatches = 0;
    int DescriptorIndex1;

	for (DescriptorIndex1 =0; DescriptorIndex1 < SDs1->RealDescriptors; DescriptorIndex1++)
    {
		int DescriptorIndex2;
		int minIndex=0;
		//int nexttominIndex;
		UINT32 distsq1, distsq2;
		distsq1 = (UINT32)-1;
		distsq2 = (UINT32)-1;

        for (DescriptorIndex2 =0; DescriptorIndex2 < SDs2->RealDescriptors; DescriptorIndex2++)
	    {
            UINT32 dsq = 0;

			int FeatIndex;
            for (FeatIndex = 0; FeatIndex < FEATURES_PER_DESCRIPTOR; FeatIndex++)
            {
                INT32 sq = (SDs1->SiftDescriptorsBasicFeatures[DescriptorIndex1][FeatIndex] -
                            SDs2->SiftDescriptorsBasicFeatures[DescriptorIndex2][FeatIndex]);
                dsq += sq*sq;
            }

            if (dsq < distsq1)
                {
                    distsq2 = distsq1;
                    distsq1 = dsq;
                    //nexttominIndex = minIndex;
                    minIndex = DescriptorIndex2;
                }
            else if (dsq < distsq2)
                {
                    distsq2 = dsq;
                    //nexttominIndex = DescriptorIndex2;
                }
        }
        if (distsq1 < (FACTOR1 * distsq2) >> FACTOR2)
            SMs->DescIx2ndImgMin[SMs->RealMatches++] = minIndex;
        //otherwise overwrite it next image1 descriptor
    }
}

/*static inline unsigned int SSD_Distance(unsigned short int *set1, unsigned short int *set2)
{
    unsigned int sum_ssd = 0;
    unsigned int ssd,i;
    for (i=0; i < 128; i++)
    {
        ssd = (*set1++) - (*set2++);
        sum_ssd += ssd *ssd;
    }
    return sum_ssd;
}*/


int test_BasicMatching_All_SSD_aligned(char* fn1, char* fn2, FILE* logfile)
{
    //forcing descriptors to have proper size: multiple of 364 for 1, multiple of 330 for second
    //const int MAX_IMG_1_DECRIPTORS = 364*5;//max 2306 - 486
    //const int MAX_IMG_2_DECRIPTORS = 330*3;//max 1196 - 206
	SiftDescriptors* SiftDescriptors1;
	SiftDescriptors* SiftDescriptors2;
	SiftMatches SM;

    fprintf(logfile, "Starting SSD16...\r\n");
    //LoadDescriptors((char*)"data/adam1.key", &SiftDescriptors1, 364);
    //LoadDescriptors((char*)"data/adam2.key", &SiftDescriptors2, 28*11);
//    SiftDescriptors1 = malloc_alligned(sizeof(SiftDescriptors), 5);
//    SiftDescriptors2 = malloc_alligned(sizeof(SiftDescriptors), 5);
    SiftDescriptors1 = (SiftDescriptors*)malloc(sizeof(SiftDescriptors));
    SiftDescriptors2 = (SiftDescriptors*)malloc(sizeof(SiftDescriptors));

    LoadDescriptors(fn1, SiftDescriptors1, 500);
    LoadDescriptors(fn2, SiftDescriptors2, 500);

    float BruteMatches = SiftDescriptors1->RealDescriptors * SiftDescriptors2->RealDescriptors;


    /* Compute on Cpu without OMP */
    FindMatches(SiftDescriptors1, SiftDescriptors2, &SM);
//     cout<<"> cpu FindMatches ran in " << Delta << " ms ("<< BruteMatches/Delta/1000 <<" MM/s)"<<flush<<endl;

    //fprintf(logfile, "cpu_ran %f MM operations \n", BruteMatches);
    //fprintf(logfile, "Found %d matches \n", SM.RealMatches);
    free(SiftDescriptors1);
    free(SiftDescriptors2);

    if ( SM.RealMatches != 29 ) {
    	fprintf(logfile, "ERROR: Wrong number of matches\r\n\r\n");
    	return 1;
    }
    if ( BruteMatches != 80958 ) {
    	fprintf(logfile, "ERROR: Wrong number of brute matches\r\n\r\n");
    	return 1;
    }
    printf("CORRECT!\r\n\r\n");
    return 0;
}
