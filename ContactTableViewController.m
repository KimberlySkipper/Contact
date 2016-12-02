//
//  ContactTableViewController.m
//  Contact
//
//  Created by Kimberly Skipper on 12/1/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "ContactTableViewController.h"

@interface ContactTableViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *streetTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;



@end

@implementation ContactTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Text Field Delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL canProceed = NO;
    
    if (self.nameTextField == textField)
    {
        NSArray *firstLastNameArray = [self.nameTextField.text componentsSeparatedByString:@" "];
        /*[self.nameTextField.text componentsSeparatedByString:@" "]
        subsitiute array name for the line of code above to clean up code and simplify understanding of code. */
        
        if (firstLastNameArray.count == 2)
        {
        
            NSString *firstName = firstLastNameArray[0];
            NSString *lastName =  firstLastNameArray[1];
            if ((![firstName isEqualToString:@""]) && (![lastName isEqualToString:@""]))
            {
                canProceed = YES;
                [self.streetTextField becomeFirstResponder];
            }
        }
    }
    else if (self.streetTextField == textField)
    {
        NSArray *streetNameArray =[self.streetTextField.text componentsSeparatedByString:@" "];
        
        if (streetNameArray.count == 3)
        {
            NSCharacterSet *streetNumbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            
            //NSString *streetName = streetNameArray[1];
           // NSString *streetType = streetNameArray[2];
            
            if ([streetNameArray[0] rangeOfCharacterFromSet:streetNumbers].location != NSNotFound)
            {
                canProceed =YES;
                [self.cityTextField becomeFirstResponder];
            }
        }
    }
    else if (self.cityTextField == textField)
    {
        if (![self.cityTextField.text isEqualToString:@""])
        {
           canProceed = YES;
            [self.stateTextField becomeFirstResponder];
        }
    }
        
    return NO;
}

@end













//if (![self.agentNameTextField.text isEqualToString:@""] && ![self.agentPasswordTextField.text isEqualToString:@""])

/*NSString *agentName = self.agentNameTextField.text;
// Additional step(s) to remove only the last name
NSString *lastName = [agentName componentsSeparatedByString:@" "][1];
self.greetingLabel.text = [NSString stringWithFormat:@"Good evening, Agent %@", lastName]; */


