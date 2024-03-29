//
//  APISectionViewController.h
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginSectionViewController : UIViewController <NSURLConnectionDelegate>

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *message;

- (void)loadWithDictionary:(NSDictionary *)dict;

@end
