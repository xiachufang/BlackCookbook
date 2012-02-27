//
//  XcfLevenshteinDitstance.m
//  LevenshteinDistance
//
//  Created by March Liu on 12-2-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "XcfLevenshteinDitstance.h"

@implementation XcfLevenshteinDitstance

+ (int) levenshteinDitstanceWithS:(NSString *)s t:(NSString *)t {
    int sl = (int)[s length]+1;
    int tl = (int)[t length]+1;
    
    if (sl==0) {
        return tl;
    }
    if (tl==0) {
        return tl;
    }
    
    int length = sl*tl;
    int *buffer = malloc(sizeof(int)*length);
    int **matrix = malloc(sizeof(int*)*sl);
    memset(buffer, 0, sizeof(int)*length);
    for (int i = 0; i<sl; i++) {
        int *ptr  = buffer+(i*tl);
        matrix[i] = ptr;
    }
    
    for (int i=0; i<sl; i++) {
        matrix[i][0]=i;
    }
    for (int i=0; i<tl; i++) {
        matrix[0][i]=i;
    }
    
    for (int i=1; i<sl; i++) {
        char sc = [s cStringUsingEncoding:NSUTF8StringEncoding][i-1];
        int cost;
        for (int j=1; j<tl; j++) {
            char tc = [t cStringUsingEncoding:NSUTF8StringEncoding][j-1];
            cost = (sc == tc)?0:1;
            int left = matrix[i-1][j]+1;
            int above = matrix[i][j-1]+1;
            int diag = matrix[i-1][i-1]+cost;
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
