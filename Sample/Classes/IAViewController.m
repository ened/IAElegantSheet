//
//  IAViewController.m
//  IAElegantSheet
//
//  Created by Ikhsan Assaat on 6/30/13.
//  Copyright (c) 2013 3kunci. All rights reserved.
//

#import "IAViewController.h"
#import "IAElegantSheet.h"

@interface IAViewController ()

@end

@implementation IAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showElegantSheet:(UIButton *)button {
    NSDictionary *dict = @{
        @"Elegant to code" : @"Using blocks handler",
        @"Elegant to see" : @"Using custom views",
        @"Custom font by default" : @"Using Roboto for default font",
    };
        
    IAElegantSheet *elegantSheet = [IAElegantSheet elegantSheetWithTitle:@"Elegant Sheet"];
    [dict enumerateKeysAndObjectsUsingBlock:^(NSString *title, NSString *message, BOOL *stop) {
        [elegantSheet addButtonsWithTitle:title block:^{ [self alert:message]; }];
    }];
    
    [elegantSheet setCancelButtonWithTitle:@"Thanks!" block:^{
        NSLog(@"Created by Ikhsan Assaat for 'Back On The Map'");
        NSLog(@"#backonthemap #objectivechackathon");
        NSLog(@"https://objectivechackathon.appspot.com/‎");
    }];
    [elegantSheet showInView:self.view];
}

- (void)alert:(NSString *)alertMessage {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Elegant Sheet" message:alertMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end