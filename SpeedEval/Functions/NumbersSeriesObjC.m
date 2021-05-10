//
//  NumbersSeriesObjC.m
//  SpeedEval
//
//  Created by WESTOWN on 10/05/2021.
//

#import "NumbersSeriesObjC.h"

@implementation NumbersSeriesObjC

-(double)getTimeElapsedOBJCForRandomListGeneration:(int)intFigure inCase:(int)algo
{
    NSMutableArray *randomArray = [[NSMutableArray alloc]init];
    NSMutableArray *boolArray = [[NSMutableArray alloc]init];
    
    /* START POINT */
    NSLog(@"OBJC_START");
    NSDate *startDate = [NSDate now];
    
    for(int i=0;i<intFigure;i++)
    {
        NSInteger randomNumber = 0;
        BOOL includedYet = false;
        
        do
        {
            switch (algo)
            {
                case 1:
                    {
                        randomNumber = arc4random()%intFigure;
                        includedYet = false;
                        boolArray = [[NSMutableArray alloc]init];
                        
                        if (i > 0)
                        {
                            for (int j=0;j<i;j++)
                            {
                                NSInteger storedNumber = [[randomArray objectAtIndex:j]integerValue];
                                if (storedNumber == randomNumber){[boolArray addObject:[NSNumber numberWithInteger:1]];}
                                else{[boolArray addObject:[NSNumber numberWithInteger:0]];}
                            }
                        }
                            NSInteger sum = 0;
                            for (NSInteger k=0;k<i;k++){sum = sum + [[boolArray objectAtIndex:k]integerValue];}
                            if (sum > 0) {includedYet = true;} else {includedYet = false;}
                        
                        break;
                    }
                case 2:
                    {
                        randomNumber = arc4random()%intFigure;
                        includedYet = false;
                        
                        if (i > 0)
                        {
                            for (int j=0;j<i;j++)
                            {
                                NSInteger storedNumber = [[randomArray objectAtIndex:j]integerValue];
                                if (storedNumber == randomNumber){includedYet = true;}
                            }
                        }
                        
                        break;
                    }
                default:
                    {
                        includedYet = false;
                    }
                    
            }
        }
        while (includedYet == true);
        
        [randomArray addObject:[NSNumber numberWithInteger:randomNumber]];
        NSLog(@"Obj-C : %li",(long)randomNumber);
    }
    
    /* END POINT */
    NSLog(@"OBJC_END");
    NSDate *endDate = [NSDate now];
    
    NSTimeInterval timeBetween = [endDate timeIntervalSinceDate:startDate];
    double interval = timeBetween / 1;
        
    return interval;
}

@end
