//
//  ViewController.m
//  CardGame
//
//  Created by 张储祺 on 2018/2/9.
//  Copyright © 2018年 张储祺. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentLabel;

@property(nonatomic,strong)Deck * deck ;
@property(nonatomic,strong)CardMatchingGame * game ;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation ViewController
-(Deck *)deck{     //覆写getter 惰性实例化
    if(!_deck)_deck = [self createDeck] ;
    return _deck ;
}
-(Deck *)createDeck{
    return [[PlayingCardDeck alloc] init] ;
}
-(CardMatchingGame *)game{
    if(!_game)_game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:self.deck] ;
    return _game ;
}
- (IBAction)touchCardButton:(UIButton *)sender {
    int chooseButtonIndex = (int)[self.cardButtons indexOfObject:sender] ;
    [self.game chooseCardAtIndex:chooseButtonIndex] ;
    [self updateUI] ;
    Card * card = [self.game cardAtIndex:[self.cardButtons indexOfObject:sender]] ;
    if(card.isChosen){
        self.currentLabel.text = [NSString stringWithFormat:@"current:%@",card.contents] ;
    }
}//
-(void)updateUI{
    for(UIButton * cardButton in self.cardButtons){
        int cardButtonIndex = (int)[self.cardButtons indexOfObject:cardButton] ;
        Card * card = [self.game cardAtIndex:cardButtonIndex] ;
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal] ;
        [cardButton setBackgroundImage:[self backgroundForCard:card] forState:UIControlStateNormal] ;
        cardButton.enabled = !card.matched ;
        self.scoreLabel.text = [NSString stringWithFormat:@"scroe: %d",(int)self.game.score] ;
    }
}
-(NSString*)titleForCard:(Card *)card{
    return card.isChosen? card.contents : nil ;
}
-(UIImage *)backgroundForCard : (Card *)card{
    return [UIImage imageNamed:card.isChosen?@"":@"CardBack"] ;
}
//
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
