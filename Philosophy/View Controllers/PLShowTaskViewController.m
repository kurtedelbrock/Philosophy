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
@synthesize pageControls;
@synthesize descriptionTextView;

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
	// Do any additional setup after loading the view.
    self.descriptionTextView.layer.borderWidth = 1.0f;
    self.descriptionTextView.layer.borderColor = [UIColor colorWithWhite:0.0f alpha:0.2f].CGColor;
    self.descriptionTextView.layer.cornerRadius = 10.0f;
    self.descriptionTextView.layer.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.05f].CGColor;
}

- (void)viewDidUnload
{
    [self setDescriptionTextView:nil];
    [self setPageControls:nil];
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

- (IBAction)reverseSwipe:(id)sender {
    NSLog(@"Reverse swipe");
    self.pageControls.currentPage--;
}

- (IBAction)forwardSwipe:(id)sender {
    NSLog(@"Forward swipe");
    self.pageControls.currentPage++;
    
}

- (IBAction)deleteButtonPressed:(id)sender {
    UIActionSheet *deleteSheet = [[UIActionSheet alloc] initWithTitle:@"Delete this task?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete" otherButtonTitles:nil];
    [deleteSheet showInView:self.view];
}
@end
