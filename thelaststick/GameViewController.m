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
    self.imagesArray = [[NSMutableArray alloc] init];
    [self.imagesArray addObject:self.image1];
    [self.imagesArray addObject:self.image2];
    [self.imagesArray addObject:self.image3];
    [self.imagesArray addObject:self.image4];
    [self.imagesArray addObject:self.image5];
    [self.imagesArray addObject:self.image6];
    [self.imagesArray addObject:self.image7];
    [self.imagesArray addObject:self.image8];
    [self.imagesArray addObject:self.image9];
    [self.imagesArray addObject:self.image10];
    [self.imagesArray addObject:self.image11];
    [self.imagesArray addObject:self.image12];
    [self.imagesArray addObject:self.image13];
    [self.imagesArray addObject:self.image14];
    [self.imagesArray addObject:self.image15];
    [self.imagesArray addObject:self.image16];
    [self.imagesArray addObject:self.image17];
    [self.imagesArray addObject:self.image18];
    [self.imagesArray addObject:self.image19];
    [self.imagesArray addObject:self.image20];
    [self.imagesArray addObject:self.image21];
    [self.imagesArray addObject:self.image22];
    [self.imagesArray addObject:self.image23];
    [self.imagesArray addObject:self.image24];
    [self.imagesArray addObject:self.image25];
    self.imgArray = [[NSMutableArray alloc] init];
    self.img = @"blueStick";
    self.first = false;
    self.firstMovement = false;
    [self.turnPlayer2 setHidden:YES];
    self.lastMovement = [[NSMutableArray alloc] init];
    self.movementImage = [[NSMutableDictionary alloc] init];
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
        for (int i = 0; i < self.imagesArray.count; i++) {
            ((UIImageView *)[self.imagesArray objectAtIndex:i]).image = [UIImage imageNamed:@"Stick"];
            [self.imgArray removeAllObjects];
            [self.lastMovement removeAllObjects];
            [self.movementImage removeAllObjects];
        }
    }
}
//Variable donde guardo la altura para ver si son de la misma fila
float lastTop;
float lastLeft;

//Evento que captura donde empiezas a tocar la pantalla
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.first = false;
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint _touchPoint = [touch locationInView:self.view];
    lastTop = _touchPoint.y;
    lastLeft = _touchPoint.x;
}

//Evento que captura el movimiento de tu dedo mientras esta en movimiento
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    
    for (int i = 0; i < self.imagesArray.count; i++) {
        if ([self isTouch:touch WithinBoundsOf:self.imagesArray[i]] && ![self.imgArray containsObject:self.imagesArray[i]]) {
            ((UIImageView *)[self.imagesArray objectAtIndex:i]).image = [UIImage imageNamed:self.img];
            [self.imgArray addObject:self.imagesArray[i]];
            [self.lastMovement addObject:self.imagesArray[i]];
            [self.movementImage setObject:self.imagesArray[i] forKey:@"img"];
            NSString *tag = [NSString stringWithFormat:@"%ld", (long)((UIImageView *)[self.imagesArray objectAtIndex:i]).tag];
            [self.movementImage setObject:tag forKey:@"tag"];
        }
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
                    CGRect _frameRectangle=[self.lastMovement[0] frame];
                    CGFloat _imageTopOld=_frameRectangle.origin.y;
                    CGFloat _imageBottomOld=_frameRectangle.size.height+_imageTopOld;
                    
                    if(lastTop >= _imageTopOld && lastTop <= _imageBottomOld){
                        NSLog(@"Estas en la misma fila");
                        int imageTag = [self.movementImage[@"tag"] intValue];
                        
                        if (imageView.tag == imageTag+1 || imageView.tag == imageTag-1) {
                            return YES;
                        } else {
                            return NO;
                        }
                        
                    } else {
                        NSLog(@"Has Tocado otra fila");
                        
                        [self.imgArray removeObjectsInArray:self.lastMovement];
                        
                        for (int i = 0; i < self.lastMovement.count; i++) {
                            ((UIImageView *)[self.lastMovement objectAtIndex:i]).image = [UIImage imageNamed:@"Stick"];
                            [self.lastMovement removeObject:self.lastMovement[i]];
                        }
                        
                        
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
