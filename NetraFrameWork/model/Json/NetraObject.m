//
//  NetraObject.m
//  NetraFrameWork
//
//  Created by Arie on 12/17/12.
//  Copyright (c) 2012 Netra. All rights reserved.
//

#import "NetraObject.h"
#import "Netra.h"
@implementation NetraObject
@synthesize title=_title;
@synthesize categories=_categories;
@synthesize date=_date;
@synthesize excerpt=_excerpt;
@synthesize id_post=_id_post;
@synthesize thumbnail=_thumbnail;
@synthesize url=_url;
@synthesize categories_id=_categories_id;
-(id)initWithDictionary:(NSDictionary *)dictionary{
	self=[super init];
	if(self){
		
		
		self.id_post=[dictionary objectForKey:@"id"];
		self.title=[[dictionary objectForKey:@"title"] gtm_stringByUnescapingFromHTML];
		self.excerpt=[[dictionary objectForKey:@"excerpt"]gtm_stringByUnescapingFromHTML];
		self.thumbnail=[dictionary objectForKey:@"thumbnail"];
	
		self.categories_id=[[[dictionary objectForKey:@"categories"]objectAtIndex:0]objectForKey:@"title"];
				
	}
	return self;
	
}

-(void) dealloc{
	
	
	[super dealloc];
}
@end

