//
//  EarthQuakeTableViewCell.h
//  NBN-Test
//
//  Created by Nikita Jain on 26/5/19.
//  Copyright © 2019 NBN. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EarthQuakeTableViewCell : UITableViewCell
@property (weak, nonatomic)IBOutlet UILabel  *placeLabel;
@property (weak, nonatomic)IBOutlet UILabel *typeLabel;
@property (weak, nonatomic)IBOutlet UILabel  *timeLabel;
@property (weak, nonatomic)IBOutlet UILabel  *magnitudeLabel;

@end

NS_ASSUME_NONNULL_END
