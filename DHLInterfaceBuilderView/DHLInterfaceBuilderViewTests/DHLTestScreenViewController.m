//
//  DHLTestViewController.m
//  DHLInterfaceBuilderView
//
//  Created by nils on 17/08/13.
//  Copyright (c) 2013 Dohle. All rights reserved.
//

#import "DHLTestScreenViewController.h"
#import "DHLTestView.h"

@interface DHLTestScreenViewController ()

@end

@implementation DHLTestScreenViewController

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
	self.view1.label.text = @"view1";
	self.view2.label.text = @"view2";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
