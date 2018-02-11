//
//  CardMatchingGame.h
//  CardGame
//
//  Created by 张储祺 on 2018/2/11.
//  Copyright © 2018年 张储祺. All rights reserved.
//模型类 用于封装所有游戏逻辑

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"
@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck ;
-(void)chooseCardAtIndex:(NSInteger)index ;
-(Card *)cardAtIndex:(NSInteger)index ;

@property(nonatomic , readonly)NSInteger score ;
@end
