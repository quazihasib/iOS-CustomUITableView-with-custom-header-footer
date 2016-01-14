//
//  ViewController.m
//  CustomTableView9
//
//  Created by Quazi Ridwan Hasib on 14/01/2016.
//  Copyright © 2016 Quazi Ridwan Hasib. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

@interface ViewController ()
{
    int *row;
    NSMutableArray *countries;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    countries = [[NSMutableArray alloc]init];
    NSArray *countriesInEurope = @[@"France",@"Spain",@"Germany",@"Great Britains", @"Italy", @"Portugal"];
    //NSDictionary *europeCountriesDict = @{@"countries" : countriesInEurope};
    
    NSArray *countriesInAsia = @[@"Bangladesh", @"Japan", @"India", @"Nepal"];
    //NSDictionary *asiaCountriesDict = @{@"countries" : countriesInAsia};
    
    NSArray *countriesInSouthAmerica = @[@"Brazil", @"Argentina", @"Uroguay", @"Nepal"];
    //NSDictionary *southAmericaCountriesDict = @{@"countries" : countriesInSouthAmerica};
    
    
    [countries addObject:countriesInEurope];
    [countries addObject:countriesInAsia];
    [countries addObject:countriesInSouthAmerica];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSDictionary *dict = countries[section];
    NSArray *arr =countries[section];
    return [arr count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [countries count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //NSDictionary *dictionary = countries[indexPath.section];
    NSArray *array = countries[indexPath.section];
    NSString *cellvalue = array[indexPath.row];
    
    cell.textLabel.text = cellvalue;
    
    return cell;
}

//View for Header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionHeaderView = [[UIView alloc] initWithFrame:
                                 CGRectMake(0, 0, tableView.frame.size.width, 50.0)];
    sectionHeaderView.backgroundColor = [UIColor cyanColor];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:
                            CGRectMake(15, 0, sectionHeaderView.frame.size.width, 25.0)];
    
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    [headerLabel setFont:[UIFont fontWithName:@"Verdana" size:20.0]];
    [sectionHeaderView addSubview:headerLabel];
    
    switch (section) {
        case 0:
            headerLabel.text = @"Europe";
            return sectionHeaderView;
            break;
        case 1:
            headerLabel.text = @"Asia";
            return sectionHeaderView;
            break;
        case 2:
            headerLabel.text = @"South America";
            return sectionHeaderView;
            break;
        default:
            break;
    }
    
    return sectionHeaderView;
}

//View for Footer
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIImage *myImage = [UIImage imageNamed:@"image2.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:myImage];
    imageView.frame = CGRectMake(10,10,1,30);
    
    return imageView;
}

//On row select
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    row = indexPath.row;
    NSLog(@"row: %d", row);
    
    NSIndexPath *selectedIndexPath = [tableView indexPathForSelectedRow];
    NSLog(@"selectedIndexPath: %ld", (long)selectedIndexPath.section);
    
//    NSString *selectedValue1 = [countries objectAtIndex:selectedIndexPath.section];
//    NSLog(@"val: %@", selectedValue1);
    
    NSArray *myArray = countries;

    
    NSLog(@"aaa: %@", myArray[selectedIndexPath.section][(NSInteger)row] );
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0f;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
