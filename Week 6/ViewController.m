//
//  ViewController.m
//  Week 6
//
//  Created by Devon Smith on 6/23/13.
//  Copyright (c) 2013 Devon Smith. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize scrollView;
@synthesize topTxtFld;
@synthesize bottomTxtFld;
@synthesize keyboardIsShown;
@synthesize currentTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //Sets up the scrollView
    [scrollView setScrollEnabled:YES];
    [scrollView setContentSize:CGSizeMake(568, 1700)];
    
    
    //sets up the keyboard/view change action
    [[NSNotificationCenter defaultCenter]
     addObserver: self
     selector:@selector(keyboardDidShow:)
     name:UIKeyboardDidShowNotification
     object:self.view.window];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(keyboardDidHide:)
     name:UIKeyboardDidHideNotification
     object:nil];}


//Hides keyboard when the background is touched.
- (IBAction) dismissKeyboard:(id)sender
{
    [topTxtFld resignFirstResponder];
    [bottomTxtFld resignFirstResponder];
}

//Methods related to changing the size of the view when the keyboard comes and goes.
-(void) textFieldDidBeginEditing:(UITextField *)textFieldView {
    currentTextField = textFieldView;
}

-(BOOL) textFieldShouldReturn:(UITextField *) textFieldView {
    [textFieldView resignFirstResponder];
    return NO;
}

-(void) textFieldDidEndEditing:(UITextField *) textFieldView {
    currentTextField = nil;
}

-(void) keyboardDidShow:(NSNotification *) notification {
    if (keyboardIsShown) return;
    
    NSDictionary* info = [notification userInfo];
    
    NSValue *aValue =
    [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect =
    [self.view convertRect:[aValue CGRectValue] fromView:nil];
    
    NSLog(@"%f", keyboardRect.size.height);
    
    CGRect viewFrame = [scrollView frame];
    viewFrame.size.height -= keyboardRect.size.height;
    scrollView.frame = viewFrame;
    
    CGRect textFieldRect = [currentTextField frame];
    [scrollView scrollRectToVisible:textFieldRect animated:YES];
    
    keyboardIsShown = YES;
}

-(void) keyboardDidHide:(NSNotification *) notification {
    NSDictionary* info = [notification userInfo];
    
    NSValue* aValue =
    [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect =
    [self.view convertRect:[aValue CGRectValue] fromView:nil];
    
    CGRect viewFrame = [scrollView frame];
    viewFrame.size.height += keyboardRect.size.height;
    scrollView.frame = viewFrame;
    
    keyboardIsShown = NO;
}



@end
