//
//  PLShowTaskViewController.h
//  Philosophy
//
//  Created by Jenny Zhang on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Item.h"
#import "PLDateParser.h"
#import "PLReminderViewController.h"

@interface PLShowTaskViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (nonatomic, retain) Item *item;
@property (weak, nonatomic) IBOutlet UILabel *itemTitle;

- (IBAction)deleteButtonPressed:(id)sender;


@end
