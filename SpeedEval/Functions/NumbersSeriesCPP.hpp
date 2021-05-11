/*
 *  FILENAME : NumbersSeriesCPP.hpp
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 10th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

#ifndef NumbersSeries_hpp
#define NumbersSeries_hpp

#include <stdio.h>
#include <iostream>
#include <string>
#include <ctime>
#include <vector>
#include <iterator>
#include <algorithm>
#include <random>

using namespace std;

class NumbersSeriesCPP
{
    public:
    double getTimeElapsedCPPForRandomListGeneration(int intFigure, int inCase);
    double generateCPPShuffledList(int maxNumber);
    double fisherYatesAlgoCPP(int n);
    void shufflingFunctionCPP(int n);
};

#endif
