//
//  ViewController.h
//  CustomTableView9
//
//  Created by Quazi Ridwan Hasib on 14/01/2016.
//  Copyright © 2016 Quazi Ridwan Hasib. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end

