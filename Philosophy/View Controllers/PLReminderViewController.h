//
//  PLReminderViewController.h
//  Philosophy
//
//  Created by Kurt Edelbrock on 6/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLDateParser.h"

@interface PLReminderViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *dateField;

- (IBAction)datePickerChanged:(id)sender;

@end
