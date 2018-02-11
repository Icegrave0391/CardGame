//
//  CardMatchingGame.m
//  CardGame
//
//  Created by 张储祺 on 2018/2/11.
//  Copyright © 2018年 张储祺. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property(nonatomic,readwrite)NSInteger score ;
@property(nonatomic,strong)NSMutableArray * cards;
@end

@implementation CardMatchingGame
-(NSMutableArray *)cards{
    if(!_cards)_cards = [[NSMutableArray alloc] init] ;
    return _cards ;
}
-(instancetype)initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck{
    self = [super init] ;
    if(self){
        for(int i = 0 ; i < count ; i ++){
            Card * card = [deck drawRandomCard] ;
            if(card){
                [self.cards addObject:card] ;
            }else{
                self = nil ;
                break ;
            }
        }
    }
    return self ;
}
-(Card *)cardAtIndex:(NSInteger)index{
    return (index<[self.cards count]? self.cards[index]:nil) ;
}
static const int MATCH_BONUS = 4 ;
static const int MISMATCH_PENALTY = 2 ;
static const int COST_TO_MATCH = 1 ;
-(void)chooseCardAtIndex:(NSInteger)index{
    Card * card = [self cardAtIndex:index] ;
    if(!card.isMatched){ //未匹配卡牌才可以被选择
        //判断选择时卡牌是否正面朝上（已经被选择
        if(card.isChosen){
            //将牌面翻回
            card.chosen = NO ;
        }else{
            //与下一个被选择的卡牌进行匹配
            for(Card * otherCard in self.cards){
                if(otherCard.isChosen&& !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]] ;
                    if(matchScore){
                        self.score += matchScore * MATCH_BONUS ;
                        otherCard.matched = YES ;
                        card.matched = YES ;
                    }else {
                        self.score -= MISMATCH_PENALTY ;
                        otherCard.chosen = NO ;
                    }
                    break ;
                }
            }
            self.score -= COST_TO_MATCH ;
            card.chosen = YES ;
        }
    }
}
@end
