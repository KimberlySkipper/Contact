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
        
        if (canProceed == NO)
        {
            self.nameTextField.backgroundColor = [UIColor redColor];
        }
        else
        {
            self.nameTextField.backgroundColor = [UIColor whiteColor];
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
                NSCharacterSet *streetName = [NSCharacterSet characterSetWithCharactersInString:@"AaBbCcDdEeFfGgHhIiJjKkLlMnNnOoPpQqRrSsTtUuVvWwXxYyZz"];
                
                
                if ([streetNameArray[1] rangeOfCharacterFromSet:streetName].location != NSNotFound)
                {
                    NSCharacterSet *streetType = [NSCharacterSet characterSetWithCharactersInString:@"AaBbCcDdEeFfGgHhIiJjKkLlMnNnOoPpQqRrSsTtUuVvWwXxYyZz"];
                    
                    if ([streetNameArray[2] rangeOfCharacterFromSet:streetType].location != NSNotFound)
                    {
                        canProceed =YES;
                        [self.cityTextField becomeFirstResponder];
                    }
                }
                
                
            }
            
        }
        
        if (canProceed == NO)
        {
            self.streetTextField.backgroundColor = [UIColor redColor];
        }
        else
        {
            self.streetTextField.backgroundColor = [UIColor whiteColor];
        }
    }
    
    
    else if (self.cityTextField == textField)
    {
        NSCharacterSet *cityName = [NSCharacterSet characterSetWithCharactersInString:@"AaBbCcDdEeFfGgHhIiJjKkLlMnNnOoPpQqRrSsTtUuVvWwXxYyZz"];
        
        if ([self.cityTextField.text rangeOfCharacterFromSet:cityName].location != NSNotFound)
        {
           canProceed = YES;
            [self.stateTextField becomeFirstResponder];
        }
        
        if (canProceed == NO)
        {
            self.cityTextField.backgroundColor = [UIColor redColor];
        }
        else
        {
            self.cityTextField.backgroundColor = [UIColor whiteColor];
        }

    }
    
    
    else if (self.stateTextField == textField)
    {
        if ([self.stateTextField.text length] == 2)
        {
            //NSCharacterSet *stateAbreviation = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ"];
            NSCharacterSet *characterSet = [NSCharacterSet uppercaseLetterCharacterSet];

            if ([self.stateTextField.text rangeOfCharacterFromSet:characterSet].location != NSNotFound)
            {
                canProceed = YES;
                [self.zipTextField becomeFirstResponder];
            }
            
        }
        
        if (canProceed == NO)
        {
            self.stateTextField.backgroundColor = [UIColor redColor];
        }
        else
        {
            self.stateTextField.backgroundColor = [UIColor whiteColor];
        }

    }
    
    
    else if (self.zipTextField == textField)
    {
        if ([self.zipTextField.text length] == 5)
        {
            NSCharacterSet *zipCode = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            
            if ([self.zipTextField.text rangeOfCharacterFromSet:zipCode].location != NSNotFound)
            {
                canProceed = YES;
                [self.phoneTextField becomeFirstResponder];
            }
        }
        
        if (canProceed == NO)
        {
            self.zipTextField.backgroundColor = [UIColor redColor];
        }
        
        else
        {
            self.zipTextField.backgroundColor = [UIColor whiteColor];
        }

    }
    
    
    else if (self.phoneTextField == textField)
    {
        if ([self.phoneTextField.text length] == 10)
        {
            NSCharacterSet *phoneNumberSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            
            if ([self.phoneTextField.text rangeOfCharacterFromSet:phoneNumberSet].location != NSNotFound)
            {
                canProceed = YES;
                [self.phoneTextField resignFirstResponder];
            }
        }
        
        if (canProceed == NO)
        {
            self.phoneTextField.backgroundColor = [UIColor redColor];
        }
        else
        {
            self.phoneTextField.backgroundColor = [UIColor whiteColor];
        }

        
    }
    
    
    

    return canProceed;
}

@end

/*UITextField *myTextField;
myTextField.borderStyle = UITextBorderStyleNone;
myTextField.backgroundColor = [UIColor redColor]; */


