//
//  PlayingCardDeck.m
//  CardGame
//
//  Created by 张储祺 on 2018/2/9.
//  Copyright © 2018年 张储祺. All rights reserved.
//

#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

-(instancetype)init{
    self = [super init];
    if(self){
        for(NSString *suit in [PlayingCard validSuits]){
            for(NSInteger rank = 1 ;rank <=[PlayingCard maxRank];rank++){
                PlayingCard *card = [[PlayingCard alloc] init] ;
                card.rank = rank ;
                card.suit = suit ;
                [self addCard:card] ;
            }
        }
    }
    return self ;
}
@end
