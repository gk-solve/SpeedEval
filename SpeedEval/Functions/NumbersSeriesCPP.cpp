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

double NumbersSeriesCPP::getTimeElapsedCPPForRandomListGeneration(int intFigure, int inCase)
{
    int randomArray[intFigure];
    int boolArray[intFigure];
    srand((unsigned int)time(NULL));
    
    /* START POINT */
    auto start = chrono::system_clock::now();
    cout << "CPP_START" << endl;
    
    for(int i=0;i<intFigure;++i)
    {
        bool includedYet = false;
        
        do
        {
            switch (inCase)
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
        
        //cout << "CPP Random number : " << randomArray[i] << endl;
    }
    
    /* END POINT */
    auto end = chrono::system_clock::now();
    cout << "CPP_END" << endl;
    
    /* ELAPSED TIME */
    chrono::duration<double>elapsed_seconds = end-start;
    //time_t end_time = chrono::system_clock::to_time_t(end);
        
    //cout << "FINISHED COMPUTATION AT " << ctime(&end_time) << endl;
    //cout << "ELAPSED TIME :" << elapsed_seconds.count() << endl;//"s\n";
    
    return elapsed_seconds.count();
}

double NumbersSeriesCPP::generateCPPShuffledList(int maxNumber)
{
    vector <int> straightArray;
    for(int i=0;i<maxNumber;++i){straightArray.push_back(i);}
    int straightInitialCount = int(straightArray.size());
    
    vector <int> randomArray;
    
    srand((unsigned int)time(NULL));
    
    /* START POINT */
    auto start = chrono::system_clock::now();
    cout << "CPP_Shuffle_START" << endl;
    
    for(int j=0;j<straightInitialCount;++j)
    {
        int randomPickedIndex = rand() % (int(straightArray.size()));
        randomArray.push_back(straightArray[randomPickedIndex]);
        straightArray.erase(straightArray.begin()+randomPickedIndex);
    }
    
    /* END POINT */
    auto end = chrono::system_clock::now();
    cout << "CPP_Shuffle_END" << endl;
    
    /* ELAPSED TIME */
    chrono::duration<double>elapsed_seconds = end-start;
    //time_t end_time = chrono::system_clock::to_time_t(end);
        
    //cout << "FINISHED COMPUTATION AT " << ctime(&end_time) << endl;
    //cout << "ELAPSED TIME :" << elapsed_seconds.count() << endl;//"s\n";
    
    return elapsed_seconds.count();
}

double NumbersSeriesCPP::fisherYatesAlgoCPP(int n)
{
    /*-----------------------------------------*/
    /* START POINT */
    auto start = chrono::system_clock::now();
    cout << "CPP_Shuffle_START" << endl;
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
    cout << "CPP_Shuffle_END" << endl;
    chrono::duration<double>elapsed_seconds = end-start;
    /*-----------------------------------------*/

    return elapsed_seconds.count();
}

void NumbersSeriesCPP::shufflingFunctionCPP(int n)
{
    vector <int> straightArray;
    for(int k=0;k<n;++k){straightArray.push_back(k);}
    
    auto rng = default_random_engine{};
    shuffle(begin(straightArray), end(straightArray), rng);
    
    for (int i = 0;i<10;++i){cout << "Shuffle (shuffling function) : " << straightArray[i] << endl;}
}

/* Some doubts about this implementation of the Fisher-Yates algorithm */
/*
void NumbersSeriesCPP::fisherYatesShuffling(int *arr, int n)
{
    int a[n];
    int ind[n];
    
    for (int i = 0; i<n; ++i)
        ind[i] = 0;
    int index;
    
    for (int i=0;i<n;++i)
    {
        do{index = rand() % n;}
        while (ind[index] != 0);
        
        ind[index] = 1;
        a[i] = *(arr + index);
    }
    
    for (int i = 0;i<n;++i){cout << a[i] << endl;}
}
*/
