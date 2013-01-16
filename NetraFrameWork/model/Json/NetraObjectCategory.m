//
//  NetraObjectCategory.m
//  NetraFrameWork
//
//  Created by Arie on 1/16/13.
//  Copyright (c) 2013 Netra. All rights reserved.
//

#import "NetraObjectCategory.h"
#import "Netra.h"
@implementation NetraObjectCategory

@synthesize id_category=_id_category;
@synthesize title=_title;
-(id)initWithDictionary:(NSDictionary *)dictionary{
	self=[super init];
	if(self){
		
		
		self.id_category=[dictionary objectForKey:@"id"];
		self.title=[dictionary objectForKey:@"title"];
		
	}
	return self;
	
}
-(void) dealloc{
	
	
	[super dealloc];
}

@end
