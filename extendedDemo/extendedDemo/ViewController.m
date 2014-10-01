//
//  ViewController.m
//  extendedDemo
//
//  Created by AndruX on 7/22/14.
//  Copyright (c) 2014 Andrii Tishchenko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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
    self.fextFieldPadding05.paddingHorizontal = 5.0f;
    
    self.fextFieldPadding5.paddingHorizontal = 5.0f;
    self.fextFieldPadding5.paddingHorizontal = 5.0f;
    
    NSDate*date = [NSDate date];
    NSInteger diff1 = [date daysBetweenDate:[NSDate date]];

    NSDate *newDate2 = [date dateByAddingTimeInterval:60*60*24*1];
    NSInteger diff2 = [date daysBetweenDate:newDate2];

    NSDate *newDate3 = [date dateByAddingTimeInterval:60*60*24*10];
    NSInteger diff3 = [date daysBetweenDate:newDate3];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
