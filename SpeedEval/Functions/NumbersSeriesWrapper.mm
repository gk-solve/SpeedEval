//
//  NumbersSeriesWrapper.m
//  SpeedEval
//
//  Created by GK on 09/05/2021.
//

#import <Foundation/Foundation.h>
#import "NumbersSeriesWrapper.h"

#import "NumbersSeries.hpp"

@implementation NumbersSeriesWrapper

-(void)printRandomFromCPP
{
    NumbersSeries numbers;
    numbers.printRandom();
}

-(void)printRandomFromObjCPP
{
    for (int i=0;i<10;++i){cout << "From ObjCPP : " << rand() << endl;};
}

-(double)getTimeElapsedForRandomListGeneration:(int)intFigure inCase:(int)algo
{
    int randomArray[intFigure];
    int boolArray[intFigure];
    
    
    /* START POINT */
    auto start = chrono::system_clock::now();
    cout << "START" << endl;
    
    for(int i=0;i<intFigure;++i)
    {
        bool includedYet;
        
        do
        {
            switch (algo)
            {
                case 1:
                    {
                        randomArray[i] = rand() % (intFigure);
                        includedYet = NO;
                        if (i > 0){for (int j=0;j<i;++j){if (randomArray[i]==randomArray[j]){boolArray[j]=1;}else{boolArray[j]=0;}}}
                            int sum = 0;
                            for (int k=0;k<i;++k){sum=sum+boolArray[k];}
                            if (sum > 0) {includedYet = YES;} else {includedYet = NO;};
                        break;
                    }
                case 2:
                    {
                        randomArray[i] = rand() % (intFigure);
                        includedYet = NO;
                        if (i > 0){for (int j=0;j<i;++j){if (randomArray[i]==randomArray[j]){includedYet = YES;}}}
                        break;
                    }
                default:
                    {
                        includedYet = NO;
                    }
            }
        }
        while (includedYet == YES);
        
        //cout << "Random number : " << randomArray[i] << endl;
    }
    
    /* END POINT */
    auto end = chrono::system_clock::now();
    cout << "END" << endl;
    
    /* ELAPSED TIME */
    chrono::duration<double>elapsed_seconds = end-start;
    time_t end_time = chrono::system_clock::to_time_t(end);
        
    cout << "FINISHED COMPUTATION AT " << ctime(&end_time) << endl;
    cout << "ELAPSED TIME :" << elapsed_seconds.count() << endl;//"s\n";
    
    return elapsed_seconds.count();
}

@end
