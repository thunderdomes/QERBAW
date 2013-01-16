//
//  LeftViewController.m
//  NetraFrameWork
//
//  Created by Arie on 12/15/12.
//  Copyright (c) 2012 Netra. All rights reserved.
//

#import "LeftViewController.h"
#import "AFNetworking.h"
#import "NetraObjectCategory.h"
#import "Categories.h"
@interface LeftViewController ()

@end

@implementation LeftViewController
@synthesize netraMutableArrayCategory=_netraMutableArrayCategory;
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
	self.netraMutableArrayCategory=[NSMutableArray array];
	// Do any additional setup after loading the view.
}

-(void)initCategory{
	NSArray *data=[Categories MR_findAll];
	NSLog(@"data--->%u",[data count]);
	NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
	Categories *categories= [Categories MR_createInContext:localContext];
	if([data count]==0){
				
	}
	

}
- (void) getCategories:(NSNotification *) notification
{
	[self initCategory];
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
				NetraObjectCategory *NetraObjectData=[[NetraObjectCategory alloc] initWithDictionary:netraDictionary];
				if (![self.netraMutableArrayCategory containsObject:NetraObjectData]) {
					[self.netraMutableArrayCategory addObject:NetraObjectData];
				}
				
			[NetraObjectData release];
				
			}
			for(int i=0;i<self.netraMutableArrayCategory.count; i++){
				NetraObjectCategory *data=[self.netraMutableArrayCategory objectAtIndex:i];
				NSLog(@"Kategory->%@,indexnya adalah->%@",data.title,data.id_category);
				
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
