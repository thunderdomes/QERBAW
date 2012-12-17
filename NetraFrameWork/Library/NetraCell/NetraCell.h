//
//  NetraCell.h
//  NetraFrameWork
//
//  Created by Arie on 12/17/12.
//  Copyright (c) 2012 Netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetraCell : UITableViewCell
{


	UIImageView *thumbnail;
}
@property(nonatomic,strong)UILabel *title;
@property(nonatomic,strong)UILabel *excerpt;
@property(nonatomic,strong)UIImageView *thumbnail;
@end
