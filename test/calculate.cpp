//
//  calculate.cpp
//  Preload
//
//  Created by Hugo Ayre on 5/26/17.
//  Copyright © 2017 Team Alpha. All rights reserved.
//

#include <iostream>
#include "header.h"
#include <math.h>
using namespace std;

float numStandardsStandard(float price, float numDrinks, float standards){
   return ((numDrinks * standards) / price);
}
float numStandardsPercent(float price, float numDrinks, float volumne, float percent){
    return ((numDrinks *(volumne/1000 * percent * 0.789)) / price );
}

float compareResults(float result){
    float oldResult;
    if (oldResult != result){
        float oldResult = result;
        return oldResult;
    }
    return 0.0;
}
