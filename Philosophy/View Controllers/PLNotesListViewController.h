//
//  PLNotesListViewController.h
//  Philosophy
//
//  Created by Jenny Zhang on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "PLAppDelegate.h"
#import "Item.h"
#import "PLShowTaskViewController.h"

@interface PLNotesListViewController : UITableViewController <NSFetchedResultsControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainListTableView;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UIView *addCellView;
@property (weak, nonatomic) IBOutlet UITextField *addCellTextField;
@property (strong, nonatomic) UIBarButtonItem *cancelButton;
@property (strong, nonatomic) UIBarButtonItem *addButton;

- (IBAction)addButtonPressed:(id)sender;

@end
