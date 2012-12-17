//
//  NetraObject.h
//  NetraFrameWork
//
//  Created by Arie on 12/17/12.
//  Copyright (c) 2012 Netra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetraObject: NSObject

@property(nonatomic,strong) NSString *id_post;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *url;
@property(nonatomic,strong) NSString *excerpt;
@property(nonatomic,strong) NSString *date;
@property(nonatomic,strong) NSString *categories_id;
@property(nonatomic,strong) NSString *categories;
@property(nonatomic,strong) NSString *thumbnail;

-(id)initWithDictionary:(NSDictionary *)dictionary;

@end

