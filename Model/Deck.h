//
//  Deck.h
//  CardGame
//
//  Created by 张储祺 on 2018/2/9.
//  Copyright © 2018年 张储祺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop ;
-(void)addCard:(Card *)card ;

-(Card *)drawRandomCard ;
@end
