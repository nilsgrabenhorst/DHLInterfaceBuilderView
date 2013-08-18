//
//  DHLInterfaceBuilderView.h
//
//  Created by Nils Grabenhorst on 16.03.13.
//  Copyright (c) 2013 Dohle. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 This is an abstract class for UIView subclasses with a xib file.
 Add a view xib file with the name matching the DHLInterfaceBuilderView's subclass name. Set the file's owner class to the DHLInterfaceBuilderView's subclass. Connect the #loadedSuperview outlet to the main view of the xib file. Add any subviews to that main view, conect outlets/actions as needed. If the #loadedSuperview outlet is not set, the first object of the top level objects of the nib file will be used instead (which is probably what you want anyway).
 */
@interface DHLInterfaceBuilderView : UIView <NSCoding>
/**
 Connect this outlet to the main view in your xib file (that is the topmost in the view hierarchy, containing all the other views).
 */
@property (nonatomic, retain) IBOutlet UIView *loadedSuperview;

#pragma mark - Template Methods
/**
 This method will be called after the view has been loaded and all outlets have been connected. Override this method for any further setup.
 */
- (void)viewDidLoad;
@end