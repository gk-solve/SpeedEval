/*
 *  FILENAME : NumbersSeriesObjCPP.h
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 9th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

#import <Foundation/Foundation.h>

@interface NumbersSeriesObjCPP: NSObject

-(double)getTimeElapsedOBJCPPForRandomListGeneration:(int)intFigure inCase:(int)algo;
-(double)getTimeElapsedCPPForRandomListGeneration:(int)intFig inCase:(int)algo;
-(double)getTimeElapsedCPPForShuffledList:(int)maxNb;
-(void)shufflingFunctionCPP:(int)maxNb;
-(double)fisherYatesAlgoCPP:(int)maxNb;

@end

