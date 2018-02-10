//
//  Deck.m
//  CardGame
//
//  Created by 张储祺 on 2018/2/9.
//  Copyright © 2018年 张储祺. All rights reserved.
//

#import "Deck.h"
@interface Deck()
@property(nonatomic,strong)NSMutableArray * cards ;
@end

@implementation Deck      
-(NSMutableArray *)cards{
    if(!_cards)_cards = [[NSMutableArray alloc] init] ;
    return _cards ;
}
-(void)addCard:(Card *)card atTop:(BOOL)atTop{
    if(atTop){
        [self.cards insertObject:card atIndex:0] ;
    }else{
        [self.cards addObject:card] ;
    }
}
-(void)addCard:(Card *)card{
    [self addCard:card atTop:NO] ;
}

-(Card *)drawRandomCard{
    Card * randomCard = nil ;
    if([self.cards count]){
        unsigned int index = arc4random() %[self.cards count] ;
        randomCard = self.cards[index] ;
        [self.cards removeObjectAtIndex:index] ;
    }
    return randomCard ;
}

@end
