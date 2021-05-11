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

-(double)fisherYatesAlgoObjC:(int)maxnumber
{
    /*-----------------------------------------*/
    /* START POINT */
    NSDate *startDate = [NSDate now];
    NSLog(@"ObjC_FisherYates_START date : %@",startDate);
    /*-----------------------------------------*/
    
    NSMutableArray *straightArray = [[NSMutableArray alloc]init];
    for (int i=0;i<maxnumber;i++){[straightArray addObject:[NSNumber numberWithInteger:i]];}
        
    for (int i = maxnumber-1; i != 0; i--)
    {
        int j = arc4random()% (i - 0 + 1);
        [straightArray exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    
    //for (int i = 0;i<maxnumber;i++){NSLog(@"Shuffle (Fisher_yates) - OBJC : %li",(long)[[straightArray objectAtIndex:i]integerValue]);}
    
    /*-----------------------------------------*/
    /* END POINT */
    NSDate *endDate = [NSDate now];
    NSLog(@"ObjC_FisherYates_END date : %@",endDate);
    NSTimeInterval timeBetween = [endDate timeIntervalSinceDate:startDate];
    double interval = timeBetween / 1;
    /*-----------------------------------------*/
        
    return interval;
}

@end
