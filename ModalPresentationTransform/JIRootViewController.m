//
//  JIRootViewController.m
//  ModalPresentationTransform
//
//  Created by Jose Ibanez on 3/16/13.
//  Copyright (c) 2013 Jose Ibanez. All rights reserved.
//

#import "JIRootViewController.h"
#import "JIModalViewController.h"

@interface JIRootViewController ()

- (void)present:(id)sender;

@end

@implementation JIRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(present:)];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
}


- (void)present:(id)sender {
    JIModalViewController *vc = [[JIModalViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

@end
