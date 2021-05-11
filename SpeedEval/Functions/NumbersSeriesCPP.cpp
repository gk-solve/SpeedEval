/*
 *  FILENAME : NumbersSeriesCPP.cpp
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 10th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

#include "NumbersSeriesCPP.hpp"

double NumbersSeriesCPP::fisherYatesAlgoCPP(int n)
{
    /*-----------------------------------------*/
    /* START POINT */
    auto start = chrono::system_clock::now();
    cout << "CPP_FisherYates_START" << endl;
    /*-----------------------------------------*/
    
    int straightArray[n];
    for(int k=0;k<n;++k){straightArray[k] = k;}
    
    srand((unsigned int)time(NULL));
    
    for (int i = n-1; i != 0; i--)
    {
        int j = rand() % (i - 0 + 1);
        swap(straightArray[i],straightArray[j]);
    }
    
    //for (int i = 0;i<n;++i){cout << "Shuffle (fisher yates) : " << straightArray[i] << endl;}
    
    /*-----------------------------------------*/
    /* END POINT */
    auto end = chrono::system_clock::now();
    cout << "CPP_FisherYates_END" << endl;
    chrono::duration<double>elapsed_seconds = end-start;
    /*-----------------------------------------*/

    return elapsed_seconds.count();
}

