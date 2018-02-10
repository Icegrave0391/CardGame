//
//  ViewController.m
//  CardGame
//
//  Created by 张储祺 on 2018/2/9.
//  Copyright © 2018年 张储祺. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
@interface ViewController ()
@property(nonatomic)int flipsCount ;
@property(nonatomic,strong)Deck * deck ;
@end

@implementation ViewController
-(Deck *)deck{     //覆写getter 惰性实例化
    if(!_deck)_deck = [self createDeck] ;
    return _deck ;
}
-(Deck *)createDeck{
    return [[PlayingCardDeck alloc] init] ;
}
- (IBAction)touchCardBotton:(UIButton *)sender {
    if([sender.currentTitle length]){
        [sender setImage:[UIImage imageNamed:@"CardBack"] forState:UIControlStateNormal] ;
        [sender setTitle:@"" forState:UIControlStateNormal] ;
        self.flipsCount ++ ; //注意此处会同时调用setter和getter
    }else{
        Card * randomCard = [self.deck drawRandomCard] ;
        if(randomCard){
            [sender setImage:[UIImage imageNamed:@"CardFront"] forState:UIControlStateNormal] ;
            [sender setTitle:randomCard.contents forState:UIControlStateNormal] ;
            self.flipsCount ++ ; //注意此处会同时调用setter和getter
        }
    }
    
    NSLog(@"%d",self.flipsCount) ;
}
//覆写setter botton调用setter触发效果
-(void)setFlipsCount:(int)flipsCount{
    _flipsCount = flipsCount ;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips:%d",_flipsCount] ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
