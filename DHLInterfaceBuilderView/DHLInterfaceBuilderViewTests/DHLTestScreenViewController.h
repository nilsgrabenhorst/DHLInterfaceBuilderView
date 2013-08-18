//
//  DHLTestViewController.h
//  DHLInterfaceBuilderView
//
//  Created by nils on 17/08/13.
//  Copyright (c) 2013 Dohle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DHLTestView;

@interface DHLTestScreenViewController : UIViewController
@property (weak, nonatomic) IBOutlet DHLTestView *view1;
@property (weak, nonatomic) IBOutlet DHLTestView *view2;
@end
