//
//  NetraViewController.m
//  NetraFrameWork
//
//  Created by Arie on 12/17/12.
//  Copyright (c) 2012 Netra. All rights reserved.
//

#import "NetraViewController.h"
#import "NetraObject.h"
#import "AFNetworking.h"
#import "NetraCell.h"
@interface NetraViewController ()

@end

@implementation NetraViewController
@synthesize netraMutableArray=_netraMutableArray;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Travel Editor Desk";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSLog(@"Available Font Families: %@", [UIFont familyNames]);
	self.netraMutableArray=[NSMutableArray array];
	[self fetchJson];
    // Do any additional setup after loading the view from its nib.
}
-(void)fetchJson{
	NSString *baseUrl=[NSString stringWithFormat:@"http://www.wego.co.id/berita/v1/api/get_recent_posts?json=1&count=10&page=1"];
	
	NSURL *URL=[NSURL URLWithString:baseUrl];
	NSLog(@"URL-->%@",baseUrl);
	NSMutableURLRequest *request=[[NSMutableURLRequest alloc] initWithURL:URL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60];
	AFJSONRequestOperation *operation=[[AFJSONRequestOperation alloc] initWithRequest:request];
	
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
		
		for(id netraDictionary in [responseObject objectForKey:@"posts"]){
			NetraObject *NetraObjectData=[[NetraObject alloc] initWithDictionary:netraDictionary];
			[self.netraMutableArray addObject:NetraObjectData];
			[NetraObjectData release];
			[NetraTableViewController reloadData];
		
		
		}
		
		//[self loadSearchBox];
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		if(error){
			[UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
			
		}
	}];
	[operation start];
	[operation release];
	// create fetch object, this objects fetch's the objects out of the database
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
    return [self.netraMutableArray count];
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	NetraCell *cell       = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	NetraObject *dataObject=[self.netraMutableArray objectAtIndex:indexPath.row];
	if (cell == nil)
	{
		cell= [[NetraCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
		//cell=[[[NetraCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier ]autorelease];
	}
	cell.title.text=dataObject.title;
	cell.excerpt.text=dataObject.excerpt;
	if(dataObject.thumbnail){
		cell.thumbnail.frame=CGRectMake(240, 5, 75, 75);
	}
	[cell.thumbnail setImageWithURL:[NSURL URLWithString:dataObject.thumbnail]
                   placeholderImage:[UIImage imageNamed:@"Default-picture-alt"]];
	cell.title.frame=CGRectMake(5, 5, 230, 0);
	cell.title.backgroundColor=[UIColor clearColor];
	[cell.title sizeToFit];
	cell.excerpt.frame=CGRectMake(5,cell.title.bounds.size.height+10, 230, 40);
	//[excerpt sizeToFit];
	cell.excerpt.backgroundColor=[UIColor clearColor];

	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
	/* statements here */
	
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
	return 150;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [NetraTableViewController release];
    [super dealloc];
}
@end
