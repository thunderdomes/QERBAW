//
//  NetraCell.m
//  NetraFrameWork
//
//  Created by Arie on 12/17/12.
//  Copyright (c) 2012 Netra. All rights reserved.
//

#import "NetraCell.h"
#import <QuartzCore/QuartzCore.h>

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
		
		title.numberOfLines=3;
		title.lineBreakMode=NSLineBreakByWordWrapping;
		title.textAlignment=NSTextAlignmentLeft;
		//title.font=[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18];
		[title setFont:[UIFont fontWithName:@"OpenSans-Bold" size:17]];
		[title sizeToFit]; 
		excerpt=[[UILabel alloc]init];
		excerpt.backgroundColor=[UIColor clearColor];
	
		excerpt.numberOfLines=3;
		excerpt.font=[UIFont fontWithName:@"OpenSans" size:14];
		excerpt.textAlignment=NSTextAlignmentLeft;
		
		thumbnail=[[UIImageView alloc]init];
		thumbnail.layer.cornerRadius=5;
		thumbnail.layer.masksToBounds = YES;
		thumbnail.layer.shouldRasterize= YES;

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
- (void)layoutSubviews {
	
    [super layoutSubviews];
	}

@end
