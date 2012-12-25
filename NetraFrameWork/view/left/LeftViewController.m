//
//  LeftViewController.m
//  NetraFrameWork
//
//  Created by Arie on 12/15/12.
//  Copyright (c) 2012 Netra. All rights reserved.
//

#import "LeftViewController.h"
#import "AFNetworking.h"
@interface LeftViewController ()

@end

@implementation LeftViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.view.backgroundColor=[UIColor lightGrayColor];
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(getCategories:)
													 name:@"TestNotification"
												   object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) getCategories:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
	
    if ([[notification name] isEqualToString:@"TestNotification"])
	{
		
		NSString *baseUrl=[NSString stringWithFormat:@"http://www.wego.co.id/berita/v1/api/get_category_index/"];
		
		NSURL *URL=[NSURL URLWithString:baseUrl];
		
		NSMutableURLRequest *request=[[NSMutableURLRequest alloc] initWithURL:URL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60];
		AFJSONRequestOperation *operation=[[AFJSONRequestOperation alloc] initWithRequest:request];
		
		[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
		
			for(id netraDictionary in [responseObject objectForKey:@"categories"]){
				NSLog(@"response--->%@",responseObject);
						}
			
			
		} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
			if(error){
				NSLog(@"Error: %@", [error localizedDescription]);
				[[[[UIAlertView alloc] initWithTitle:@"Error fetching Netra!"
											 message:@"Please try again later"
											delegate:nil
								   cancelButtonTitle:@"OK"
								   otherButtonTitles:nil] autorelease] show];
				
			}
		}];
		[operation start];
		[operation release];
		// create fetch object, this objects fetch's the objects out of the database
	}
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
