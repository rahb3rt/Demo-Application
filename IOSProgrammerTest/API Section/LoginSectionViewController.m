//
//  APISectionViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "LoginSectionViewController.h"
#import "MainMenuViewController.h"
#import "loginData.h"

@interface LoginSectionViewController()

@property (nonatomic, strong) IBOutlet UITextField *username;
@property (nonatomic, strong)IBOutlet UITextField *password;

@end

@implementation LoginSectionViewController


- (void)loadWithDictionary:(NSDictionary *)dict
{
    self.code = [dict objectForKey:@"code"];
    self.message = [dict objectForKey:@"message"];
}

    
    

- (void)viewDidLoad{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender
{
    MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
}

- (IBAction)login:(id)sender {
    
    NSString *usr = _username.text;
    NSString *pass = _password.text;
    
    dispatch_queue_t queue = dispatch_queue_create("Q", NULL);
    dispatch_async(queue, ^{
        NSInteger success = 1;
        
        NSURL *url = [NSURL URLWithString:@"http://dev3.apppartner.com/AppPartnerDeveloperTest/scripts/login.php"];
        NSData *postData = [[[NSString alloc] initWithFormat:@"method=methodName&username=%@&password=%@", usr, pass] dataUsingEncoding:NSUTF8StringEncoding];
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        NSDate *methodStart = [NSDate date];
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setHTTPBody:postData];
        
        NSError *requestError = [[NSError alloc] init];
        NSHTTPURLResponse *response = nil;
        NSData *urlData = [NSURLConnection sendSynchronousRequest:request
                                                returningResponse:&response
                                                            error:&requestError];
        
        //if communication was successful
        if ([response statusCode] >= 200 && [response statusCode] < 300) {
            NSError *serializeError = nil;
            NSDictionary *jsonData = [NSJSONSerialization
                                      JSONObjectWithData:urlData
                                      options:NSJSONReadingMutableContainers
                                      error:&serializeError];
            success = [jsonData[@"ERROR"] integerValue];
            
            if (success == 0) {
                
                NSDate *methodFinish = [NSDate date];
                NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
                
                NSString *code = [jsonData objectForKey:@"code"];
                
                NSString *message= [jsonData objectForKey:@"message"];
                
                NSString *time = [NSString stringWithFormat:@"%f", executionTime];
                
                NSString *output = [NSString stringWithFormat:@"%@ in %@ sec", message, time];
                NSLog(@"%@", output);
                
                UIAlertView *alert_4 = [[UIAlertView alloc]
                    initWithTitle:code
                    message: output
                    delegate:self
                    cancelButtonTitle:@"Ok"
                    otherButtonTitles:nil];
                [alert_4 show];
            }
            else {
                UIAlertView *alert_2 = [[UIAlertView alloc] initWithTitle:@"Unsuccesful Connection"
                    message:@"Your connection was not successful"
                    delegate:self
                    cancelButtonTitle:@"Quit"
                    otherButtonTitles:nil];
                [alert_2 show];
            }
        }
        else {
            UIAlertView *alert_3 = [[UIAlertView alloc] initWithTitle:@"Unsuccesful Connection"
                message:@"Your connection was not successful"
                delegate:self
                cancelButtonTitle:@"Quit"
                otherButtonTitles:nil];
            [alert_3 show];
        }
    });
    
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    // the user clicked OK
    if (buttonIndex == 0) {
        
        MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
        [self.navigationController pushViewController:mainMenuViewController animated:YES];
    }
}





@end
