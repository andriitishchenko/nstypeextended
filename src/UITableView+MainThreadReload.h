//
//  UITableView+MainThreadReload.h
//  beepex
//
//  Created by Andrii Tishchenko on 10.07.14.
//  Copyright (c) 2014 AndruX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (MainThreadReload)
-(void)reloadDataInMainThread;
@end
