/*
 *  FILENAME : NumbersSeriesObjCPP.mm
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 9th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "NumbersSeriesObjCPP.h"
#import "NumbersSeriesCPP.hpp"

@implementation NumbersSeriesObjCPP

-(double)getTimeElapsedOBJCPPForRandomListGeneration:(int)intFigure inCase:(int)algo
{
    int randomArray[intFigure];
    int boolArray[intFigure];
    
    /* START POINT */
    auto start = chrono::system_clock::now();
    cout << "OBJCPP_START" << endl;
    
    for(int i=0;i<intFigure;++i)
    {
        bool includedYet = false;
        
        do
        {
            switch (algo)
            {
                case 1:
                    {
                        randomArray[i] = rand() % (intFigure);
                        includedYet = false;
                        if (i > 0){for (int j=0;j<i;++j){if (randomArray[i]==randomArray[j]){boolArray[j]=1;}else{boolArray[j]=0;}}}
                            int sum = 0;
                            for (int k=0;k<i;++k){sum=sum+boolArray[k];}
                            if (sum > 0) {includedYet = true;} else {includedYet = false;};
                        break;
                    }
                case 2:
                    {
                        randomArray[i] = rand() % (intFigure);
                        includedYet = false;
                        if (i > 0){for (int j=0;j<i;++j){if (randomArray[i]==randomArray[j]){includedYet = true;break;}}}
                        break;
                    }
                default:
                    {
                        cout << "Default case" << endl;
                    }
            }
        }
        while (includedYet == true);
        
        //cout << "Random number : " << randomArray[i] << endl;
    }
    
    /* END POINT */
    auto end = chrono::system_clock::now();
    cout << "OBJCPP_END" << endl;
    
    /* ELAPSED TIME */
    chrono::duration<double>elapsed_seconds = end-start;
    //time_t end_time = chrono::system_clock::to_time_t(end);
        
    //cout << "FINISHED COMPUTATION AT " << ctime(&end_time) << endl;
    //cout << "ELAPSED TIME :" << elapsed_seconds.count() << endl;//"s\n";
    
    return elapsed_seconds.count();
}

-(double)getTimeElapsedCPPForRandomListGeneration:(int)intFig inCase:(int)algo;
{
    NumbersSeriesCPP numbers;
    return numbers.getTimeElapsedCPPForRandomListGeneration(intFig, algo);
}

-(double)getTimeElapsedCPPForShuffledList:(int)maxNb
{
    NumbersSeriesCPP numbers;
    return numbers.generateCPPShuffledList(maxNb);
}

-(void)shufflingFunctionCPP:(int)maxNb
{
    NumbersSeriesCPP numbers;
    numbers.shufflingFunctionCPP(maxNb);
}

-(double)fisherYatesAlgoCPP:(int)maxNb
{
    NumbersSeriesCPP numbers;
    return numbers.fisherYatesAlgoCPP(maxNb);
}

@end
