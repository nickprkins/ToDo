//
//  DetailViewController.h
//  ToDo
//
//  Created by Nick Perkins on 5/3/16.
//  Copyright © 2016 Nick Perkins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSManagedObject *detailItem;
@property (weak, nonatomic) MasterViewController * masterVC;
@property (weak, nonatomic) IBOutlet UITextField *detailTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UISwitch *taskCompleteSwitch;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

