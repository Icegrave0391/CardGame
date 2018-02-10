//
//  PlayingCard.h
//  CardGame
//
//  Created by 张储祺 on 2018/2/9.
//  Copyright © 2018年 张储祺. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property(nonatomic,strong)NSString * suit ;
@property(nonatomic)NSInteger rank ;

//保护API的类方法
+(NSArray *)validSuits ;
+(NSInteger )maxRank ;
@end
