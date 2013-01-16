//
//  NetraViewController.h
//  NetraFrameWork
//
//  Created by Arie on 12/17/12.
//  Copyright (c) 2012 Netra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "detailViewController.h"
@interface NetraViewController : UIViewController< UITableViewDelegate,UITableViewDataSource>{

	IBOutlet UITableView *NetraTableViewController;
	NSInteger current_page;
	NSInteger total_page;
	detailViewController *netraDetail;

	
}
@property(nonatomic,retain) NSMutableArray *netraMutableArray;
@end
