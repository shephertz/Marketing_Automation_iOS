//
//  ViewController.m
//  App42MarketingAutomationSample
//
//  Created by Rajeev Ranjan on 14/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

#import "ViewController.h"

#import <Shephertz_App42_iOS_API/Shephertz_App42_iOS_API.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)trackEvent:(id)sender
{
    
    NSString *eventName = self.eventNameTextField.text;
    
    if (eventName && eventName.length)
    {
        EventService *eventService = [App42API buildEventService];
        NSDictionary *properties = [NSDictionary dictionaryWithObjectsAndKeys:@"Admin",@"Role", nil];
        [eventService trackEventWithName:eventName andProperties:properties completionBlock:^(BOOL success, id responseObj, App42Exception *exception) {
            if (success) {
                NSLog(@"Event tracked successfully");
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Track Event" message:@"Event tracked successfully" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    NSLog(@"Alert Canceled");
                }];
                [alertController addAction:cancelAction];
                [self presentViewController:alertController animated:NO completion:^{
                    NSLog(@"Alert Presented");
                }];

            }
            else
            {
                NSLog(@"Event tracking failed...try again");
                NSLog(@"Exception Reason = %@",exception.reason);
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Track Event Exception" message:exception.reason preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    NSLog(@"Alert Canceled");
                }];
                [alertController addAction:cancelAction];
                [self presentViewController:alertController animated:NO completion:^{
                    NSLog(@"Alert Presented");
                }];
            }
        }];
    }
    else
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Invalid Event" message:@"Please enter Event Name!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"Alert Canceled");
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:NO completion:^{
            NSLog(@"Alert Presented");
        }];
    }
    [self.eventNameTextField resignFirstResponder];
}


#pragma mark- TextField Delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
