//
//  XcfLevenshteinDitstance.m
//  LevenshteinDistance
//
//  Created by March Liu on 12-2-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "XcfLevenshteinDitstance.h"

@implementation XcfLevenshteinDitstance

+ (int) levenshteinDitstanceFromS:(NSString *)source toT:(NSString *)target {
    int sl = (int)[source length]+1;
    int tl = (int)[target length]+1;
    
    if (sl==1) {
        return tl - 1;
    }
    if (tl==1) {
        return sl - 1;
    }
    
    int length = sizeof(int)*sl*tl;
    int *buffer = malloc(length);
    int **matrix = malloc(sizeof(int*)*sl);
    memset(buffer, 0, length);
    for (int i = 0; i<sl; i++) {
        matrix[i] = buffer+(i*tl);
    }
    
    for (int i=0; i<sl; i++) {
        matrix[i][0]=i;
    }
    for (int i=1; i<tl; i++) {
        matrix[0][i]=i;
    }
    
    for (int i=1; i<sl; i++) {
        unichar sc = [source characterAtIndex:i-1];
        for (int j=1; j<tl; j++) {
            unichar tc = [target characterAtIndex:j-1];
            int cost = (sc == tc)?0:1;
            int above = matrix[i-1][j]+1;
            int left = matrix[i][j-1]+1;
            int diag = matrix[i-1][j-1]+cost;
            int value = MIN(above,MIN(left,diag));
            matrix[i][j]=value;
        }
    }
    int re = matrix[sl-1][tl-1];
    free(buffer);
    free(matrix);
    return re;
}

@end
