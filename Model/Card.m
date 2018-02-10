//
//  Card.m
//  CardGame
//
//  Created by 张储祺 on 2018/2/9.
//  Copyright © 2018年 张储祺. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)otherCards{
    int score = 0 ;
    for(Card * card in otherCards){
        if([card.contents isEqualToString:self.contents]){
            score = 1 ;
        }
    }
    return score ;
}
@end
