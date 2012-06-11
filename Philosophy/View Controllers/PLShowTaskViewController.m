//
//  PLShowTaskViewController.m
//  Philosophy
//
//  Created by Jenny Zhang on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PLShowTaskViewController.h"

@interface PLShowTaskViewController ()

@end

@implementation PLShowTaskViewController
@synthesize itemTitle;

@synthesize descriptionTextView, item;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.itemTitle.text = item.title;
    self.descriptionTextView.text = [item printDescription];
    
	// Do any additional setup after loading the view.
    self.descriptionTextView.layer.borderWidth = 1.0f;
    self.descriptionTextView.layer.borderColor = [UIColor colorWithWhite:0.0f alpha:0.2f].CGColor;
    self.descriptionTextView.layer.cornerRadius = 10.0f;
    self.descriptionTextView.layer.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.05f].CGColor;
}

- (void)viewDidUnload
{
    [self setDescriptionTextView:nil];
    [self setItemTitle:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table View Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ReminderCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
}

- (IBAction)deleteButtonPressed:(id)sender {
    UIActionSheet *deleteSheet = [[UIActionSheet alloc] initWithTitle:@"Delete this task?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete" otherButtonTitles:nil];
    [deleteSheet showInView:self.view];
}

#pragma mark - Text View Delegate Functions
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
    if ([textView.text isEqualToString:@"Enter description..."])
        textView.text = @"";
    // Put a done button in the toolbar
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonPressed:)];
    [self.navigationItem setRightBarButtonItem:doneButton animated:YES];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [self.navigationItem setRightBarButtonItem:nil];
}

- (void)doneButtonPressed:(id)sender
{
    self.item.itemDescription = self.descriptionTextView.text;
    if ([self.descriptionTextView.text isEqualToString:@""])
        self.descriptionTextView.text = @"Enter description...";
    
    NSError *error = nil;
    if (![[self.item managedObjectContext] save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    [self.descriptionTextView resignFirstResponder];
}

@end
