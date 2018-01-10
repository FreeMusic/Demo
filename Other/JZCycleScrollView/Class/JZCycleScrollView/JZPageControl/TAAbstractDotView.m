//
//  TAAbstractDotView.m
//  JZCycleScrollView
//
//  Created by mic on 2017/11/22.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "TAAbstractDotView.h"

@implementation TAAbstractDotView

- (id)init{
    
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"You must override %@ in %@", NSStringFromSelector(_cmd), self.class] userInfo:nil];
    
}

- (void)changeActivityState:(BOOL)active{
    
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"You must override %@ in %@", NSStringFromSelector(_cmd), self.class] userInfo:nil];
    
}

@end
