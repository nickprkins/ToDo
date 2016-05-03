//
//  DetailViewController.m
//  ToDo
//
//  Created by Nick Perkins on 5/3/16.
//  Copyright © 2016 Nick Perkins. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailTextField.text = [[self.detailItem valueForKey:@"title"] description];
        if ([[[self.detailItem valueForKey:@"done"]description]  isEqual: @NO]) {
            [self.taskCompleteSwitch setOn:NO animated:YES];
            self.statusLabel.text = [NSString stringWithFormat:@"Task Incomplete "];
        }else{
            [self.taskCompleteSwitch setOn:YES animated:YES];
            self.statusLabel.text = [NSString stringWithFormat:@"Task Complete "];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancelButtonTapped:(UIButton*)sender{
    
    self.detailTextField.text = [[self.detailItem valueForKey:@"title"] description];

}

-(IBAction)saveButtonTapped:(UIButton*)sender{

    [self.detailItem setValue:self.detailTextField.text forKey:@"title"];
    NSError *error;
    
    if (![self.detailItem.managedObjectContext save:&error]) {
        NSLog(@"unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    self.saveButton.enabled = NO;
    self.cancelButton.enabled = NO;
    
    [self.masterVC detailChangedObject];
}


@end
