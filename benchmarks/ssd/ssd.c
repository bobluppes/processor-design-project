/*
 * File:   main.cpp
 * Author: Calin (bcalin1984@yahoo.com)
 *
 * Created on December 19, 2012, 3:32 PM
 *
 */

#include <stdio.h>
#include "hal.h"

int test_BasicMatching_All_SSD_aligned(char* fn1, char* fn2, FILE* logfile);

#ifdef CUSTOM_MAIN

extern unsigned long long int get_ticks();
int _main_ssd(int argc ,char *argv[]);

#ifdef ALL_BENCHMARKS
double _ssd()
#else
int main(int argc, char *argv[])
#endif
{
	unsigned long long int t1,t2;
    char *args1[]={"ssd","adam1.key","adam2.key"};
    t1 = get_ticks();
    _main_ssd(3,args1);
    t2 = get_ticks();
    printf("----------------------------------------------------------\r\n");
    printf("SSD took %'.6lf million clock cycles\r\n",(t2-t1)/1000000.0);
    printf("----------------------------------------------------------\r\n");
#ifdef ALL_BENCHMARKS
    return (t2-t1)/1000000.0;
#else
    printf("%c\n",0xFE); // Signal termination to board server
    return 0;
#endif
}

int _main_ssd(int argc, char *argv[])
#else
int main (int argc, char *argv[])
#endif
{
//    char *LogFileName = (char*)"RunScores.log";
//    FILE *logfile = fopen(LogFileName, "w");

	FILE *logfile = stdout;
    if (argc == 3)
    {
        char *fn1 =(char*)argv[1];
        char *fn2 =(char*)argv[2];
        test_BasicMatching_All_SSD_aligned(fn1, fn2, logfile);
        //fclose(logfile);
    }
    else
    {
        printf("Usage: ssd infile1 infile2\n");
        return 0;
    }
    return 0;
}

