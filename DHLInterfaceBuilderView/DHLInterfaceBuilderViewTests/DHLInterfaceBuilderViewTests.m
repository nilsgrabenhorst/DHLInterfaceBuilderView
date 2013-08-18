//
//  DHLInterfaceBuilderViewTests.m
//  DHLInterfaceBuilderViewTests
//
//  Created by nils on 17/08/13.
//  Copyright (c) 2013 Dohle. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "DHLTestView.h"
#import "DHLTestScreenViewController.h"

@interface DHLInterfaceBuilderViewTests : XCTestCase
@property (strong, nonatomic) DHLTestScreenViewController *controller;
@end

@implementation DHLInterfaceBuilderViewTests

- (void)setUp
{
    [super setUp];
	NSBundle *testBundle = [NSBundle bundleForClass:[DHLTestScreenViewController class]];
    self.controller = [[DHLTestScreenViewController alloc] initWithNibName:nil
																	bundle:testBundle];
	[self.controller view];
}

- (void)tearDown
{
    self.controller = nil;
    [super tearDown];
}

- (void)testMainView_outletsConnected
{
	XCTAssertNotNil(self.controller.view1, @"view1 outlet not connected, or nib not loaded");
	XCTAssertNotNil(self.controller.view2, @"view2 outlet not connected, or nib not loaded");
}

- (void)testSubViewLabels_haveCorrectTexts
{
	XCTAssertEqualObjects(self.controller.view1.label.text, @"view1", @"LabelText not correct");
	XCTAssertEqualObjects(self.controller.view2.label.text, @"view2", @"LabelText not correct");
}

@end
