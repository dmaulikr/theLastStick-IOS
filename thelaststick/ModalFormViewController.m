//
//  ModalFormViewController.m
//  thelaststick
//
//  Created by Victor Alvarez Perez on 01/06/14.
//  Copyright (c) 2014 Victor Alvarez Perez. All rights reserved.
//

#import "ModalFormViewController.h"
#import "GameViewController.h"

@interface ModalFormViewController ()

@end

@implementation ModalFormViewController

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
    self.inputFieldPLayer1.delegate = self;
    self.inputFieldPlayer2.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"pushFromSource"]) {
        GameViewController *gvc = [segue destinationViewController];
        gvc.namePlayer1 = self.inputFieldPLayer1.text;
        gvc.namePlayer2 = self.inputFieldPlayer2.text;
    }
}

// Cambiar color de la barra de estado
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

// Inicio mostrar teclado sin que oculte UITextField para iphone 4
#define kOFFSET_FOR_KEYBOARDip4 110.0
// Inicio mostrar teclado sin que oculte UITextField para iphone 5
#define kOFFSET_FOR_KEYBOARDip5 30.0

-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    if ([sender isEqual:self])
    {
        //move the main view, so that the keyboard does not hide it.
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    }
}

//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        NSLog(@"%f", height);
        if (height == 480) {
            rect.origin.y -= kOFFSET_FOR_KEYBOARDip4;
            rect.size.height += kOFFSET_FOR_KEYBOARDip4;
        } else {
            rect.origin.y -= kOFFSET_FOR_KEYBOARDip5;
            rect.size.height += kOFFSET_FOR_KEYBOARDip5;
        }
    }
    else
    {
        // revert back to the normal state.
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        if (height == 480) {
            rect.origin.y += kOFFSET_FOR_KEYBOARDip4;
            rect.size.height -= kOFFSET_FOR_KEYBOARDip4;
        } else {
            rect.origin.y += kOFFSET_FOR_KEYBOARDip5;
            rect.size.height -= kOFFSET_FOR_KEYBOARDip5;
        }
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}


- (void)viewWillAppear:(BOOL)animated
{
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}
//Fin mostrar teclado sin que oculte UITextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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
