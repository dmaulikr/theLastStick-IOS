//
//  ModalFormViewController.h
//  thelaststick
//
//  Created by Victor Alvarez Perez on 01/06/14.
//  Copyright (c) 2014 Victor Alvarez Perez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalFormViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *inputFieldPLayer1;
@property (nonatomic, strong) IBOutlet UITextField *inputFieldPlayer2;
@property (nonatomic) bool moved;

@end
