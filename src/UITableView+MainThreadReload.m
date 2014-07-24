//
//  UITableView+MainThreadReload.m
//  beepex
//
//  Created by Andrii Tishchenko on 10.07.14.
//  Copyright (c) 2014 AndruX. All rights reserved.
//

#import "UITableView+MainThreadReload.h"

@implementation UITableView (MainThreadReload)
-(void)reloadDataInMainThread{
    if ([NSThread isMainThread]) {
        [self reloadData];
    }
    else
    {
        [self performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
    }
}
@end
