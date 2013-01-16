//
//  NetraObjectCategory.h
//  NetraFrameWork
//
//  Created by Arie on 1/16/13.
//  Copyright (c) 2013 Netra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetraObjectCategory : NSObject
@property(nonatomic,strong) NSString *id_category;
@property(nonatomic,strong) NSString *title;
-(id)initWithDictionary:(NSDictionary *)dictionary;
@end
