//
//  Data.h
//  NetraFrameWork
//
//  Created by Arie on 1/16/13.
//  Copyright (c) 2013 Netra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Data : NSManagedObject

@property (nonatomic, retain) NSNumber * id_post;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * categories;
@property (nonatomic, retain) NSString * excerpt;

@end
