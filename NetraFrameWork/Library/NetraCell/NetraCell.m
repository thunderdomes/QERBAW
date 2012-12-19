//
//  NetraCell.m
//  NetraFrameWork
//
//  Created by Arie on 12/17/12.
//  Copyright (c) 2012 Netra. All rights reserved.
//

#import "NetraCell.h"

@implementation NetraCell
@synthesize title;
@synthesize excerpt;
@synthesize thumbnail;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		title=[[UILabel alloc]init];
		title.backgroundColor=[UIColor clearColor];
		title.frame=CGRectMake(90, 5, 230, 50);
		title.numberOfLines=2;
		//title.font=[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18];
		[title setFont:[UIFont fontWithName:@"OpenSans-Bold" size:20]];
		
		excerpt=[[UILabel alloc]init];
		excerpt.backgroundColor=[UIColor clearColor];
		excerpt.frame=CGRectMake(90,50, 230, 100);
		excerpt.numberOfLines=4;
		excerpt.font=[UIFont fontWithName:@"HelveticaNeue" size:14];
		excerpt.textAlignment=NSTextAlignmentLeft;
		
		thumbnail=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 75, 75)];
		
		

    }
	[self.contentView addSubview:title];
	[self.contentView addSubview:excerpt];
	[self.contentView addSubview:thumbnail];

    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
