//
//  ViewController.h
//  NBN-Test
//
//  Created by Nikita Jain on 22/5/19.
//  Copyright © 2019 NBN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
-(void)getEarthQuakeData;
@property BOOL status;
@property (weak, nonatomic) IBOutlet UITableView *eTableView;
@end

