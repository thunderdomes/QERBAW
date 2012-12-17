//
//  NetraObject.m
//  NetraFrameWork
//
//  Created by Arie on 12/17/12.
//  Copyright (c) 2012 Netra. All rights reserved.
//

#import "NetraObject.h"

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
		self.title=[dictionary objectForKey:@"title"];
		self.excerpt=[dictionary objectForKey:@"excerpt"];
		self.thumbnail=[[[[[dictionary objectForKey:@"attachments"] objectAtIndex:0]objectForKey:@"images"]objectForKey:@"thumbnail"]objectForKey:@"url"];
		/*
		self.thumbnail=[[[[dictionary objectForKey:@"attachments"]objectForKey:@"image"]objectForKey:@"thumbnail"]objectForKey:@"url"];
		 */
		self.categories_id=[[[dictionary objectForKey:@"categories"]objectAtIndex:0]objectForKey:@"title"];
		//self.categories=[[dictionary objectForKey:@"categories"]objectForKey:@"title"];
		
		//self.offer=[dictionary objectForKey:@"offer"];
		
	}
	return self;
	
}
/*
 -(BOOL)isEqual:(id)object{
 if(![object isKindOfClass:[NetraDealsObject class]])
 {
 
 return NO;
 }
 NetraDealsObject *other=(NetraDealsObject*)object;
 return other.headline;
 }
 */
-(void) dealloc{
	
	
	[super dealloc];
}
@end

