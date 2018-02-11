//
//  PlayingCard.m
//  CardGame
//
//  Created by 张储祺 on 2018/2/9.
//  Copyright © 2018年 张储祺. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit ; //这很重要 因为setter和getter方法都覆写了，所以没有自动合成
+(NSArray *)validSuits{
    return @[@"♠️",@"♣️",@"♥️",@"♦️"] ;
}
+(NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"] ;
}
+(NSInteger)maxRank{
    return [[self rankStrings] count] -1 ;
}
//覆写父类方法实现实例化 覆写setter，getter保护API
-(NSString *)contents{
    NSArray * rankString = [PlayingCard rankStrings] ;
    return[rankString[self.rank] stringByAppendingString:self.suit] ;
}
-(void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit])
        _suit = suit ;
}
-(NSString *)suit{
    return _suit ? _suit : @"?" ;
}
-(void)setRank:(NSInteger)rank{
    if(rank<=[PlayingCard maxRank])
        _rank = rank ;
}
//覆写匹配方法使得积分合理
-(int)match:(NSArray *)otherCards{
    int score = 0 ;
    if([otherCards count] == 1){
        PlayingCard * newCard = [otherCards firstObject] ;
        if(newCard.rank == self.rank){
            score = 4 ;
        }else if(newCard.suit == self.suit){
            score = 1 ;
        }
    }
    return score ;
}
@end
