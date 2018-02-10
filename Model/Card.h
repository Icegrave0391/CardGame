//
//  Card.h
//  CardGame
//
//  Created by 张储祺 on 2018/2/9.
//  Copyright © 2018年 张储祺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(nonatomic,strong)NSString * contents ;

@property(nonatomic,getter=isChosen) BOOL chosen ;
@property(nonatomic,getter=isMatched) BOOL matched ;
-(int)match:(NSArray *)otherCards ;
@end
