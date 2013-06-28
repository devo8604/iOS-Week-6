//
//  ViewController.h
//  Week 6
//
//  Created by Devon Smith on 6/23/13.
//  Copyright (c) 2013 Devon Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *topTxtFld;
@property (weak, nonatomic) IBOutlet UITextField *bottomTxtFld;
@property BOOL keyboardIsShown;
@property UITextField *currentTextField;

- (IBAction) dismissKeyboard:(id)sender;



@end
