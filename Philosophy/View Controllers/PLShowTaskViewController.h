//
//  PLShowTaskViewController.h
//  Philosophy
//
//  Created by Jenny Zhang on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface PLShowTaskViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UIPageControl *pageControls;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
- (IBAction)reverseSwipe:(id)sender;
- (IBAction)forwardSwipe:(id)sender;
- (IBAction)deleteButtonPressed:(id)sender;

@end
