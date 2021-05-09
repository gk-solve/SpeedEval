//
//  NumbersSeries.cpp
//  SpeedEval
//
//  Created by WESTOWN on 09/05/2021.
//

#include "NumbersSeries.hpp"

int * NumbersSeries::getRandomArray()
{
    static int r[10];
    
    srand((unsigned)time(NULL));
    
    for (int i=0;i<10;++i)
    {
        r[i] = rand();
        cout << "From CPP : " << r[i] <<endl;
    }
    
    return r;
}

void NumbersSeries::printRandom()
{
    int *p;
    p = getRandomArray();

}


