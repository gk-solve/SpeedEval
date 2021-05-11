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

-(double)fisherYatesAlgoObjCPP:(int)maxNb
{
    /*-----------------------------------------*/
    /* START POINT */
    auto start = chrono::system_clock::now();
    cout << "ObjCPP_FisherYates_START" << endl;
    /*-----------------------------------------*/
    
    int straightArray[maxNb];
    for(int k=0;k<maxNb;++k){straightArray[k] = k;}
    
    srand((unsigned int)time(NULL));
    
    for (int i = maxNb-1; i != 0; i--)
    {
        int j = rand() % (i - 0 + 1);
        swap(straightArray[i],straightArray[j]);
    }
    
    //for (int i = 0;i<maxNb;++i){cout << "Shuffle (fisher yates) - ObjCPP : " << straightArray[i] << endl;}
    
    /*-----------------------------------------*/
    /* END POINT */
    auto end = chrono::system_clock::now();
    cout << "ObjCPP_FisherYates_END" << endl;
    chrono::duration<double>elapsed_seconds = end-start;
    /*-----------------------------------------*/

    return elapsed_seconds.count();
}

-(double)fisherYatesAlgoCPP:(int)maxNb
{
    NumbersSeriesCPP numbers;
    return numbers.fisherYatesAlgoCPP(maxNb);
}

@end
