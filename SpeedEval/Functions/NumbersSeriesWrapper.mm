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
    cout << "START" << endl;
    
    for (int i=0;i<50;++i)
    {
        cout << rand() << endl;
    };
    
    auto end = chrono::system_clock::now();
    cout << "END" << endl;
    
    chrono::duration<double>elapsed_seconds = end-start;
    time_t end_time = chrono::system_clock::to_time_t(end);
    
    //cout << "FINISHED COMPUTATION AT" << ctime(&end_time) << "elapsed time :" << elapsed_seconds.count() << "s\n";
    
    cout << "FINISHED COMPUTATION AT " << ctime(&end_time) << endl;
    cout << "ELAPSED TIME :" << elapsed_seconds.count() << "s\n";
}

-(NSMutableArray*)returnSingleValuesInArray:(NSArray*)arr
{
    NSMutableArray *finalArray = [[NSMutableArray alloc]init];

    for (int i=0;i<[arr count];++i)
    {
        NSObject *newObject = [arr objectAtIndex:i];
        
        if(i==0){[finalArray addObject:newObject];}
        else
        {
            if(![finalArray containsObject:newObject])
            {
                [finalArray addObject:newObject];
                cout << newObject << endl;
            }
        }
    }
    return finalArray;
}

-(int)getTimeElapsedToGenerateRandomNumbersList:(int)intFigure
{
    NSMutableArray *finalArray = [[NSMutableArray alloc]init];
    
    int randomArray[intFigure];
    int boolArray[intFigure];
    bool includedYet = NO;
    
    /* START POINT */
    auto start = chrono::system_clock::now();
    cout << "START" << endl;
    
    for(int i=0;i<intFigure;++i) //on va renseigner randomArray index par index
    {
        do //à chaque index, on va boucler jusqu'à ce que l'on trouve une valeur qui n'a pas déjà été stockée dans les index précédents
        {
            randomArray[i] = rand() % (intFigure);//on identifie donc une première valeur au hasard, puis on va la tester
            
            //premier cas, le plus simple, à l'index 0, il n'y a pas de sujet -> booleen = 0 et la boucle s'arrête pour cet index
            if(i == 0){includedYet = NO;}
            else if (i > 0)//puis viennent les index supérieurs, où chaque valeur trouvée au hasard doit être testée par rapport aux précédentes
            {
                //dès qu'on trouve une valeur égale avant, on stocke la valeur 1 dans boolArray, sinon la valeur 0
                for (int j=0;j<i;++j){if (randomArray[i]==randomArray[j]){boolArray[j]=1;}else{boolArray[j]=0;}}
            }
            
            int sum = 0;
            for (int k=0;k<i;++k){sum=sum+boolArray[k];}//on fait la somme des valeurs stockées dans boolArray.
            if (sum > 0) {includedYet = YES;} else {includedYet = NO;};//si la somme > 0, la valeur trouvée au hasard existe déjà, et on doit donc continuer la boucle
        }
        while (includedYet == YES);
        
        //cout << "Random number : " << randomArray[i] << endl;
        
        NSNumber *randomElement = [NSNumber numberWithInteger:randomArray[i]];
        [finalArray addObject:randomElement]; //randomArrayMemory est le tableau que l'on va garder pour la suite de cette vue
    }
    
    /* END POINT */
    auto end = chrono::system_clock::now();
    cout << "END" << endl;
    
    /* ELAPSED TIME */
    chrono::duration<double>elapsed_seconds = end-start;
    time_t end_time = chrono::system_clock::to_time_t(end);
    
    //cout << "FINISHED COMPUTATION AT" << ctime(&end_time) << "elapsed time :" << elapsed_seconds.count() << "s\n";
    
    cout << "FINISHED COMPUTATION AT " << ctime(&end_time) << endl;
    cout << "ELAPSED TIME :" << elapsed_seconds.count() << endl;//"s\n";
    
    return elapsed_seconds.count();
    
    //return finalArray;
}



@end
