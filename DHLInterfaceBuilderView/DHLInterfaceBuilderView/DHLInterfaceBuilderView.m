//
//  DHLInterfaceBuilderView.m
//
//  Created by Nils Grabenhorst on 16.03.13.
//  Copyright (c) 2013 Dohle. All rights reserved.
//

#import "DHLInterfaceBuilderView.h"

@implementation DHLInterfaceBuilderView

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if ((self = [super initWithCoder:aDecoder])) {
		[self loadSubviewsFromNib];
	}
	return self;
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
	
}

- (void)loadSubviewsFromNib {
	NSArray *topLevelObjects = [[NSBundle bundleForClass:[self class]] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
	if ([topLevelObjects count] == 0) {
		[NSException raise:@"com.Dohle.InterfaceBuilderView.NibLoadingException"
					format:@"Loading of nib named '%@' failed. TopLevelObjects: %@", NSStringFromClass([self class]), topLevelObjects];
	}
	if (!self.loadedSuperview) {
		self.loadedSuperview = [topLevelObjects objectAtIndex:0];
	}
	self.loadedSuperview.frame = self.frame;
	for (UIView *subview in [self.loadedSuperview subviews]) {
		[self addSubview:subview];
	}
	for (NSLayoutConstraint *constraint in self.loadedSuperview.constraints) {
		// if an item is the loaded superview we need to replace it by THIS view (self):
		id newFirstItem = constraint.firstItem;
		if ([newFirstItem isEqual:self.loadedSuperview]) {
			newFirstItem = self;
		}
		id newSecondItem = constraint.secondItem;
		if ([newSecondItem isEqual:self.loadedSuperview]) {
			newSecondItem = self;
		}
		
		CGFloat constant;
		@try {
			constant = constraint.constant;
		}
		@catch (NSException *exception) {
			/*
			 Trying to read the constant of a constraint defined in a xib file with
			 a "standard" constant will cause this crazy meaningless exception to be thrown.
			 To avoid it we use this try/catch block to prevent the app from crashing and set
			 the 'standard' constant to the standard value (currently 20).
			 */
			constant = 20;
		}
		
		NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem:newFirstItem
																		 attribute:constraint.firstAttribute
																		 relatedBy:constraint.relation
																			toItem:newSecondItem
																		 attribute:constraint.secondAttribute
																		multiplier:constraint.multiplier
																		  constant:constant];
		// We need to remove the obsolete constraints from the unused loadedSuperview. For some reason, they would remain
		// in the layout engine otherwise but cannot be referenced for removal later, causing a crash.
		// Removing them here fixes the issue:
		[self.loadedSuperview removeConstraint:constraint];
		[self addConstraint:newConstraint];
	}
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self loadSubviewsFromNib];
		[self viewDidLoad];
    }
    return self;
}

- (void)awakeFromNib {
	[super awakeFromNib];
	[self viewDidLoad];
}


@end
