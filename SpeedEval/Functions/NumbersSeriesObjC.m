/*
 *  FILENAME : NumbersSeriesObjC.m
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 10th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

#import "NumbersSeriesObjC.h"

@implementation NumbersSeriesObjC

-(double)getTimeElapsedOBJCForRandomListGeneration:(int)intFigure inCase:(int)algo
{
    NSMutableArray *randomArray = [[NSMutableArray alloc]init];
    NSMutableArray *boolArray = [[NSMutableArray alloc]init];
    
    /* START POINT */
    NSDate *startDate = [NSDate now];
    NSLog(@"OBJC_START date : %@",startDate);
    
    for(int i=0;i<intFigure;i++)
    {
        NSInteger randomNumber = 0;
        BOOL includedYet = false;
        
        do
        {
            switch (algo)
            {
                case 1:

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

                case 2:

                        randomNumber = arc4random()%intFigure;
                        includedYet = false;
                        
                        if (i > 0)
                        {
                            for (int j=0;j<i;j++)
                            {
                                NSInteger storedNumber = [[randomArray objectAtIndex:j]integerValue];
                                if (storedNumber == randomNumber){includedYet = true;break;}
                            }
                        }
                        
                        break;
                        
                case 3:
                        randomNumber = arc4random()%intFigure;
                        includedYet = false;
                        if([randomArray containsObject:[NSNumber numberWithInteger:randomNumber]]){includedYet = true;}
                        break;
        
                default:

                        NSLog(@"Default case");
            }
        }
        while (includedYet == true);
        
        [randomArray addObject:[NSNumber numberWithInteger:randomNumber]];
        //NSLog(@"Obj-C : %li",(long)randomNumber);
    }
    
    /* END POINT */
    NSDate *endDate = [NSDate now];
    NSLog(@"OBJC_END date : %@",endDate);
    
    NSTimeInterval timeBetween = [endDate timeIntervalSinceDate:startDate];
    double interval = timeBetween / 1;
        
    return interval;
}

-(double)generateOBJCShuffledList:(int)maxnumber
{
    NSMutableArray *straightArray = [[NSMutableArray alloc]init];
    for (int i=0;i<maxnumber;i++){[straightArray addObject:[NSNumber numberWithInteger:i]];}
    NSInteger straightInitialCount = [straightArray count];
    
    NSMutableArray *randomArray = [[NSMutableArray alloc]init];
    
    /* START POINT */
    NSDate *startDate = [NSDate now];
    NSLog(@"OBJC_START date : %@",startDate);
    
        for (NSInteger j=0;j<straightInitialCount;j++)
        {
            NSInteger randomPickedIndex = (arc4random()%[straightArray count]);
            [randomArray addObject:[straightArray objectAtIndex:randomPickedIndex]];
            [straightArray removeObjectAtIndex:randomPickedIndex];
            
            j++;
        }
    
    /* END POINT */
    NSDate *endDate = [NSDate now];
    NSLog(@"OBJC_END date : %@",endDate);
    
    NSTimeInterval timeBetween = [endDate timeIntervalSinceDate:startDate];
    double interval = timeBetween / 1;
        
    return interval;
}

@end
