/*
 *  FILENAME : NumbersSeriesObjC.h
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 10th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

#import <Foundation/Foundation.h>

@interface NumbersSeriesObjC : NSObject

-(double)getTimeElapsedOBJCForRandomListGeneration:(int)intFigure inCase:(int)algo;
-(double)generateOBJCShuffledList:(int)maxnumber;

@end

