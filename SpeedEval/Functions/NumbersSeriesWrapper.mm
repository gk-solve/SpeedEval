//
//  NumbersSeriesWrapper.m
//  SpeedEval
//
//  Created by WESTOWN on 09/05/2021.
//

#import <Foundation/Foundation.h>
#import "NumbersSeriesWrapper.h"

#import "NumbersSeries.hpp"

@implementation NumbersSeriesWrapper

-(void)printRandom
{
    NumbersSeries numbers;
    numbers.printRandom();
}

-(void)newPrintRandom
{
    auto start = chrono::system_clock::now();
    
    for (int i=0;i<50;++i)
    {
        cout << rand() << endl;
    };
    
    auto end = chrono::system_clock::now();
    
    chrono::duration<double>elapsed_seconds = end-start;
    time_t end_time = chrono::system_clock::to_time_t(end);
    
    cout << "finished computation at" << ctime(&end_time) << "elapsed time :" << elapsed_seconds.count() << "s\n";
}

@end
