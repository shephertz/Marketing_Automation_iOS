//
//  ViewController.h
//  App42MarketingAutomationSample
//
//  Created by Rajeev Ranjan on 14/10/15.
//  Copyright © 2015 Rajeev Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *eventNameTextField;

- (IBAction)trackEvent:(id)sender;

@end

