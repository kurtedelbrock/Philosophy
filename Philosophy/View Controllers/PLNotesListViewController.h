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

@interface PLNotesListViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainListTableView;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)addButtonPressed:(id)sender;

@end
