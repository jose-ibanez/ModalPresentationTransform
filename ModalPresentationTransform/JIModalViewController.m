//
//  JIModalController.m
//  ModalPresentationTransform
//
//  Created by Jose Ibanez on 3/16/13.
//  Copyright (c) 2013 Jose Ibanez. All rights reserved.
//

#import "JIModalViewController.h"

@interface JIModalViewController ()

- (void)dismiss:(id)sender;

@end

@implementation JIModalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismiss:)];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
}


- (void)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
