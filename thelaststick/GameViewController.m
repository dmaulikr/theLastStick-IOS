//
//  GameViewController.m
//  thelaststick
//
//  Created by Victor Alvarez Perez on 01/06/14.
//  Copyright (c) 2014 Victor Alvarez Perez. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.imgArray = [[NSMutableArray alloc] init];
    self.img = @"blueStick";
    self.first = false;
    self.firstMovement = false;
    [self.turnPlayer2 setHidden:YES];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    self.player1.text = self.namePlayer1;
    self.player2.text = self.namePlayer2;
}

-(IBAction)exit:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Estas seguro que deseas abandonar la partida?" message:nil delegate:self cancelButtonTitle:@"Salir" otherButtonTitles:@"Cancelar", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    } else {
    }
}
//Variable donde guardo la altura para ver si son de la misma fila
float lastTop;
float lastLeft;

//Evento que captura donde empiezas a tocar la pantalla
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.first = false;
    //self.lastMovement = [[NSMutableArray alloc] init];
    self.movementImage = [[NSMutableDictionary alloc] init];
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint _touchPoint = [touch locationInView:self.view];
    lastTop = _touchPoint.y;
    lastLeft = _touchPoint.x;
}

//Evento que captura el movimiento de tu dedo mientras esta en movimiento
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    
    if ([self isTouch:touch WithinBoundsOf:self.image1] && ![self.imgArray containsObject:@"img1"]) {
        NSLog(@"Has tocado la primera imagen");
        self.image1.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img1"];
        [self.lastMovement addObject:self.image1];
        [self.movementImage setObject:self.image1 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image1.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image2] && ![self.imgArray containsObject:@"img2"]) {
        NSLog(@"Has tocado la segunda imagen");
        self.image2.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img2"];
        [self.lastMovement addObject:self.image2];
        [self.movementImage setObject:self.image2 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image2.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image3] && ![self.imgArray containsObject:@"img3"]) {
        NSLog(@"Has tocado la tercera imagen");
        self.image3.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img3"];
        [self.lastMovement addObject:self.image3];
        [self.movementImage setObject:self.image3 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image3.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image4] && ![self.imgArray containsObject:@"img4"]) {
        NSLog(@"Has tocado la cuarta imagen");
        self.image4.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img4"];
        [self.lastMovement addObject:self.image4];
        [self.movementImage setObject:self.image4 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image4.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image5] && ![self.imgArray containsObject:@"img5"]) {
        NSLog(@"Has tocado la quinta imagen");
        self.image5.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img5"];
        [self.lastMovement addObject:@"img5"];
        [self.movementImage setObject:self.image5 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image5.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image6] && ![self.imgArray containsObject:@"img6"]) {
        NSLog(@"Has tocado la sexta imagen");
        self.image6.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img6"];
        [self.lastMovement addObject:@"img6"];
        [self.movementImage setObject:self.image6 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image6.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image7] && ![self.imgArray containsObject:@"img7"]) {
        NSLog(@"Has tocado la septima imagen");
        self.image7.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img7"];
        [self.lastMovement addObject:@"img7"];
        [self.movementImage setObject:self.image7 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image7.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image8] && ![self.imgArray containsObject:@"img8"]) {
        NSLog(@"Has tocado la octava imagen");
        self.image8.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img8"];
        [self.lastMovement addObject:@"img8"];
        [self.movementImage setObject:self.image8 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image8.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image9] && ![self.imgArray containsObject:@"img9"]) {
        NSLog(@"Has tocado la novena imagen");
        self.image9.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img9"];
        [self.lastMovement addObject:@"img9"];
        [self.movementImage setObject:self.image9 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image9.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image10] && ![self.imgArray containsObject:@"img10"]) {
        NSLog(@"Has tocado la decima imagen");
        self.image10.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img10"];
        [self.lastMovement addObject:@"img10"];
        [self.movementImage setObject:self.image10 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image10.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image11] && ![self.imgArray containsObject:@"img11"]) {
        NSLog(@"Has tocado la 11 imagen");
        self.image11.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img11"];
        [self.lastMovement addObject:@"img11"];
        [self.movementImage setObject:self.image11 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image11.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image12] && ![self.imgArray containsObject:@"img12"]) {
        NSLog(@"Has tocado la img12 imagen");
        self.image12.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img12"];
        [self.lastMovement addObject:@"img12"];
        [self.movementImage setObject:self.image12 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image12.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image13] && ![self.imgArray containsObject:@"img13"]) {
        NSLog(@"Has tocado la img13 imagen");
        self.image13.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img13"];
        [self.lastMovement addObject:@"img13"];
        [self.movementImage setObject:self.image13 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image13.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image14] && ![self.imgArray containsObject:@"img14"]) {
        NSLog(@"Has tocado la img14 imagen");
        self.image14.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img14"];
        [self.lastMovement addObject:@"img14"];
        [self.movementImage setObject:self.image14 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image14.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image15] && ![self.imgArray containsObject:@"img15"]) {
        NSLog(@"Has tocado la img15 imagen");
        self.image15.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img15"];
        [self.lastMovement addObject:@"img15"];
        [self.movementImage setObject:self.image15 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image15.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image16] && ![self.imgArray containsObject:@"img16"]) {
        NSLog(@"Has tocado la img16 imagen");
        self.image16.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img16"];
        [self.lastMovement addObject:@"img16"];
        [self.movementImage setObject:self.image16 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image16.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image17] && ![self.imgArray containsObject:@"img17"]) {
        NSLog(@"Has tocado la img17 imagen");
        self.image17.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img17"];
        [self.lastMovement addObject:@"img17"];
        [self.movementImage setObject:self.image17 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image17.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image18] && ![self.imgArray containsObject:@"img18"]) {
        NSLog(@"Has tocado la img18 imagen");
        self.image18.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img18"];
        [self.lastMovement addObject:@"img18"];
        [self.movementImage setObject:self.image18 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image18.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image19] && ![self.imgArray containsObject:@"img19"]) {
        NSLog(@"Has tocado la img19 imagen");
        self.image19.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img19"];
        [self.lastMovement addObject:@"img19"];
        [self.movementImage setObject:self.image19 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image19.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image20] && ![self.imgArray containsObject:@"img20"]) {
        NSLog(@"Has tocado la img20 imagen");
        self.image20.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img20"];
        [self.lastMovement addObject:@"img20"];
        [self.movementImage setObject:self.image20 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image20.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image21] && ![self.imgArray containsObject:@"img21"]) {
        NSLog(@"Has tocado la img21 imagen");
        self.image21.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img21"];
        [self.lastMovement addObject:@"img21"];
        [self.movementImage setObject:self.image21 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image21.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image22] && ![self.imgArray containsObject:@"img22"]) {
        NSLog(@"Has tocado la img22 imagen");
        self.image22.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img22"];
        [self.lastMovement addObject:@"img22"];
        [self.movementImage setObject:self.image22 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image22.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image23] && ![self.imgArray containsObject:@"img23"]) {
        NSLog(@"Has tocado la img23 imagen");
        self.image23.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img23"];
        [self.lastMovement addObject:@"img23"];
        [self.movementImage setObject:self.image23 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image23.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image24] && ![self.imgArray containsObject:@"img24"]) {
        NSLog(@"Has tocado la img24 imagen");
        self.image24.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img24"];
        [self.lastMovement addObject:@"img24"];
        [self.movementImage setObject:self.image24 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image24.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    } else if ([self isTouch:touch WithinBoundsOf:self.image25] && ![self.imgArray containsObject:@"img25"]) {
        NSLog(@"Has tocado la img25 imagen");
        self.image25.image = [UIImage imageNamed:self.img];
        [self.imgArray addObject:@"img25"];
        [self.lastMovement addObject:@"img25"];
        [self.movementImage setObject:self.image25 forKey:@"img"];
        NSString *tag = [NSString stringWithFormat:@"%ld", (long)self.image25.tag];
        [self.movementImage setObject:tag forKey:@"tag"];
    }

}

//Evento que se lanza cuando se termina de tocar la pantalla
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (self.lastMovement.count != 0 && !self.firstMovement) {
        self.firstMovement = true;
    }
    NSLog(@"count lastMovement = %lu", (unsigned long)[self.lastMovement count]);
    NSLog(@"movementImage: %@", self.movementImage[@"tag"]);
    if ([self.imgArray count] == 24) {
        if (self.turnPlayer1.hidden == 0) {
            NSLog(@"%@", self.player1.text);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador:" message:self.player1.text delegate:self cancelButtonTitle:@"Salir" otherButtonTitles:@"Volver a jugar", nil];
            [alert show];
        } else {
            NSLog(@"%@", self.player2.text);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador:" message:self.player2.text delegate:self cancelButtonTitle:@"Salir" otherButtonTitles:@"Volver a jugar", nil];
            [alert show];
        }
    }
}

//Coger coordenadas del punto que se esta tocando y ver si coincide con las coordenadas de las imaganes
-(BOOL)isTouch:(UITouch *)touch WithinBoundsOf:(UIImageView *)imageView{
    //NSLog(@"%ld", (long)imageView.tag);
    CGRect _frameRectangle=[imageView frame];
    CGFloat _imageTop=_frameRectangle.origin.y;
    CGFloat _imageLeft=_frameRectangle.origin.x;
    CGFloat _imageRight=_frameRectangle.size.width+_imageLeft;
    CGFloat _imageBottom=_frameRectangle.size.height+_imageTop;
    
    CGPoint _touchPoint = [touch locationInView:self.view];
    
        if(_touchPoint.x>=_imageLeft &&
           _touchPoint.x<=_imageRight &&
           _touchPoint.y>=_imageTop &&
           _touchPoint.y<=_imageBottom){
            
            if (lastTop >= _imageTop && lastTop <= _imageBottom) {
                if (self.lastMovement.count == 0 || !self.firstMovement) {
                    if (!self.first) {
                        self.first = true;
                        return YES;
                    } else {
                        int imageTag = [self.movementImage[@"tag"] intValue];
                        
                        if (imageView.tag == imageTag+1 || imageView.tag == imageTag-1) {
                            return YES;
                        } else {
                            return NO;
                        }
                    }
                } else {
                    for (int i = 0; i < self.lastMovement.count; i++) {
                        NSLog(@"Mirando contenido de la array");
                        NSLog(@"%@", self.lastMovement[i]);
                    }
                    return YES;
                }
            } else {
                return NO;
            }
        }else{
            return NO;
        }
}

-(IBAction)timeChange:(id)sender {
    self.first = false;
    if (!self.lastMovement || !self.lastMovement.count) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ojo!!"
                                                        message:@"Tienes que realizar algún movimiento para poder cambiar de turno"
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
        [alert show];
    } else {
        if (self.turnPlayer2.hidden == 1) {
            [self.lastMovement removeAllObjects];
            [self.turnPlayer2 setHidden:NO];
            [self.turnPlayer1 setHidden:YES];
        } else {
            [self.lastMovement removeAllObjects];
            [self.turnPlayer2 setHidden:YES];
            [self.turnPlayer1 setHidden:NO];
        }
        
        if ([self.img  isEqual: @"blueStick"]) {
            self.img = @"whiteStick";
        } else {
            self.img = @"blueStick";
        }

    }
}


// Cambiar color de la barra de estado
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
