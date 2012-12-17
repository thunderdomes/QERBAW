//
//  NetraViewController.h
//  NetraFrameWork
//
//  Created by Arie on 12/17/12.
//  Copyright (c) 2012 Netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetraViewController : UIViewController< UITableViewDelegate,UITableViewDataSource>{

	IBOutlet UITableView *NetraTableViewController;
	
}
@property(nonatomic,retain) NSMutableArray *netraMutableArray;
@end
