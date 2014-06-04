//
//  GameViewController.h
//  thelaststick
//
//  Created by Victor Alvarez Perez on 01/06/14.
//  Copyright (c) 2014 Victor Alvarez Perez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *player1;
@property (nonatomic, strong) IBOutlet UILabel *turnPlayer1;
@property (nonatomic, strong) NSString *namePlayer1;

@property (nonatomic, strong) IBOutlet UILabel *player2;
@property (nonatomic, strong) IBOutlet UILabel *turnPlayer2;
@property (nonatomic, strong) NSString *namePlayer2;

@property (nonatomic, strong) NSMutableArray *imgArray;
@property (nonatomic, strong) NSMutableDictionary *movementImage;
@property (nonatomic, strong) NSMutableArray *lastMovement;

@property (nonatomic, strong) NSString *img;
@property (nonatomic) bool first;
@property (nonatomic) bool firstMovement;

- (IBAction)timeChange:(id)sender;

@property (nonatomic, strong) IBOutlet UIImageView *image1;
@property (nonatomic, strong) IBOutlet UIImageView *image2;
@property (nonatomic, strong) IBOutlet UIImageView *image3;
@property (nonatomic, strong) IBOutlet UIImageView *image4;
@property (nonatomic, strong) IBOutlet UIImageView *image5;
@property (nonatomic, strong) IBOutlet UIImageView *image6;
@property (nonatomic, strong) IBOutlet UIImageView *image7;
@property (nonatomic, strong) IBOutlet UIImageView *image8;
@property (nonatomic, strong) IBOutlet UIImageView *image9;
@property (nonatomic, strong) IBOutlet UIImageView *image10;
@property (nonatomic, strong) IBOutlet UIImageView *image11;
@property (nonatomic, strong) IBOutlet UIImageView *image12;
@property (nonatomic, strong) IBOutlet UIImageView *image13;
@property (nonatomic, strong) IBOutlet UIImageView *image14;
@property (nonatomic, strong) IBOutlet UIImageView *image15;
@property (nonatomic, strong) IBOutlet UIImageView *image16;
@property (nonatomic, strong) IBOutlet UIImageView *image17;
@property (nonatomic, strong) IBOutlet UIImageView *image18;
@property (nonatomic, strong) IBOutlet UIImageView *image19;
@property (nonatomic, strong) IBOutlet UIImageView *image20;
@property (nonatomic, strong) IBOutlet UIImageView *image21;
@property (nonatomic, strong) IBOutlet UIImageView *image22;
@property (nonatomic, strong) IBOutlet UIImageView *image23;
@property (nonatomic, strong) IBOutlet UIImageView *image24;
@property (nonatomic, strong) IBOutlet UIImageView *image25;

-(IBAction)exit:(id)sender;

-(BOOL)isTouch:(UITouch *)touch WithinBoundsOf:(UIImageView *)imageView;

@end
