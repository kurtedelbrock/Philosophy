//
//  PLReminderViewController.h
//  Philosophy
//
//  Created by Kurt Edelbrock on 6/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLDateParser.h"
#import "Item.h"

@interface PLReminderViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *dateField;
@property (nonatomic, retain) Item *item;

- (IBAction)datePickerChanged:(id)sender;

@end
