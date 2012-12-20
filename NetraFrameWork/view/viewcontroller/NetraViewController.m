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

#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f

const int kLoadingCellTag = 1273;
@interface NetraViewController ()

@end

@implementation NetraViewController
@synthesize netraMutableArray=_netraMutableArray;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Travel Editor Desk";
		current_page=1;
		self.netraMutableArray=[NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	
	[self fetchJson];
    // Do any additional setup after loading the view from its nib.
}
-(void)fetchJson{

	NSString *baseUrl=[NSString stringWithFormat:@"http://www.wego.co.id/berita/v1/api/get_recent_posts?json=1&count=10&page=%d",current_page];
	
	NSURL *URL=[NSURL URLWithString:baseUrl];

	NSMutableURLRequest *request=[[NSMutableURLRequest alloc] initWithURL:URL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60];
	AFJSONRequestOperation *operation=[[AFJSONRequestOperation alloc] initWithRequest:request];
	
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
		total_page=[[responseObject objectForKey:@"pages"]intValue];
		for(id netraDictionary in [responseObject objectForKey:@"posts"]){
			NetraObject *NetraObjectData=[[NetraObject alloc] initWithDictionary:netraDictionary];
			if (![self.netraMutableArray containsObject:NetraObjectData]) {
                [self.netraMutableArray addObject:NetraObjectData];
            }
			
			[NetraObjectData release];
			
			//NSLog(@"self.netraMutableArray.count--->%d",[self.netraMutableArray count]);
			
		}
		
		[NetraTableViewController reloadData];
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
	if (current_page == 0) {
        return 1;
    }
    
    if (current_page < total_page) {
        return self.netraMutableArray.count + 1;
    }
	
    return self.netraMutableArray.count;
	
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = [UIColor colorWithRed:0.957 green:0.957 blue:0.957 alpha:1];
	
		if (cell.tag == kLoadingCellTag) {
			current_page++;
				[self fetchJson];
		}

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < self.netraMutableArray.count) {
        return [self NetraCellForIndexPath:indexPath];
    } else {
        return [self loadingCell];
    }
}
- (UITableViewCell *)NetraCellForIndexPath:(NSIndexPath *)indexPath {
	NetraCell *cell       = [NetraTableViewController dequeueReusableCellWithIdentifier:@"Cell"];
	NetraObject *dataObject=[self.netraMutableArray objectAtIndex:indexPath.row];
	if (cell == nil)
	{
		cell= [[NetraCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
		//cell=[[[NetraCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier ]autorelease];
	}
	cell.title.text=dataObject.title;
	cell.excerpt.text=dataObject.excerpt;
	cell.title.frame=CGRectMake(5, 5, 230, 0);
	cell.title.backgroundColor=[UIColor clearColor];
	[cell.title sizeToFit];
	cell.excerpt.frame=CGRectMake(5,cell.title.bounds.size.height+10, 230, 40);
	//[excerpt sizeToFit];
	cell.excerpt.backgroundColor=[UIColor clearColor];

	if(dataObject.thumbnail){
		cell.thumbnail.frame=CGRectMake(235, 10, 75, 75);
		[cell.thumbnail setImageWithURL:[NSURL URLWithString:dataObject.thumbnail]
					   placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]];
		cell.title.frame=CGRectMake(5, 5, 220, 0);
		cell.title.backgroundColor=[UIColor clearColor];
		[cell.title sizeToFit];
		cell.excerpt.frame=CGRectMake(5,cell.title.bounds.size.height+10, 230, 40);
		//[excerpt sizeToFit];
		cell.excerpt.backgroundColor=[UIColor clearColor];
		
	}
	else{
		cell.title.frame=CGRectMake(5, 5, 300, 0);
		cell.title.backgroundColor=[UIColor clearColor];
		[cell.title sizeToFit];
		cell.thumbnail.frame=CGRectMake(0, 0, 0, 0);
		cell.excerpt.frame=CGRectMake(5,cell.title.bounds.size.height+10, 300, 40);
		//[excerpt sizeToFit];
		cell.excerpt.backgroundColor=[UIColor clearColor];
	}
	
	
	cell.frame=CGRectMake(0, 0, 320, 100);
	return cell;


}
- (UITableViewCell *)loadingCell {
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
													reuseIdentifier:nil] autorelease];
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc]
                                                  initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.center = cell.center;
    [cell addSubview:activityIndicator];
    [activityIndicator release];
    
    [activityIndicator startAnimating];
     cell.tag = kLoadingCellTag;
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
	NSLog(@"indexPath.row -->%d",indexPath.row );
	NetraObject *dataObject=[self.netraMutableArray objectAtIndex:indexPath.row];
	NSString *text = dataObject.title;
	NSLog(@"cell--->%@",text);
	/* statements here */
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	if(indexPath.row ==([self.netraMutableArray count]))
	{
		return 44;
	
	}
	NetraObject *dataObject=[self.netraMutableArray objectAtIndex:indexPath.row];
	NSLog(@"data object--->%@",dataObject.title);
	return 160;
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
