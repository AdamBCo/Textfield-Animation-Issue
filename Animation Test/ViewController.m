//
//  ViewController.m
//  Animation Test
//
//  Created by Adam Cooper on 4/25/16.
//  Copyright © 2016 Adam Cooper. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) NSLayoutConstraint *heightConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];

    [self.view addSubview:self.textField];
    
    [self setupConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    [self.view layoutIfNeeded];
    
    self.heightConstraint.constant = 300;
    
    
    [UIView animateWithDuration:5 delay:5 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {

    }];
    
    CALayer *model = self.textField.layer.modelLayer;
    UIView *greenView = [[UIView alloc] initWithFrame:model.frame];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.center = touchLocation;
    
    if ([self.textField.layer.presentationLayer hitTest:touchLocation])
    {
        blueView.backgroundColor = [UIColor purpleColor];
    }
    
    [self.view addSubview:blueView];
}

-(UITextField *)textField
{
    if (!_textField)
    {
        _textField = [[UITextField alloc] init];
        _textField.translatesAutoresizingMaskIntoConstraints = NO;
        _textField.backgroundColor = [UIColor yellowColor];
    }
    return _textField;
}

-(NSLayoutConstraint *)heightConstraint
{
    if (!_heightConstraint)
    {
        _heightConstraint = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.textField attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    }
    return _heightConstraint;
}


-(void)setupConstraints
{
    
    //Textfield Bar View Constraints
    [self.view addConstraint:self.heightConstraint];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.textField attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:44]];
    
}



@end
