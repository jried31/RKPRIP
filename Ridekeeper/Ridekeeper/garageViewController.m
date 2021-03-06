//
//  garageViewController.m
//  Ridekeeper
//
//  Created by CLICC User on 2/27/14.
//  Copyright (c) 2014 Dennis Grijalva. All rights reserved.
//

#import "garageViewController.h"
#import "Parse/Parse.h"
#import "garageCell.h"

@interface garageViewController ()

@end

@implementation garageViewController

@synthesize vehicletable;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //data grabbed from parse database
    [self performSelector:@selector(retrieve)];
    /*_Make = @[@"First Bike Make",
               @"Second Bike Make",];
    
    _Model = @[@"First Bike Model",
               @"Second Bike Model",];
    
    _Year = @[@"First Bike Year",
              @"Second Bike Year",];
    
    _Images = @[@"2013KawasakiNinja.png",
                @"2014SuzukiHayabusa.png"];*/
    
}
-(void)	retrieve {
    PFQuery *retrievevehicle = [PFQuery queryWithClassName:@"Vehicle"];
    [retrievevehicle whereKey:@"ownerId" equalTo:[PFUser currentUser].objectId];
    [retrievevehicle findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error){
            obj = [[NSArray  alloc]initWithArray:objects];
            
        }
        [vehicletable reloadData];
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return obj.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"garageCell";
    /*garageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    int row = [indexPath row];
    
    cell.MakeLabel.text = _Make[row];
    cell.ModelLabel.text = _Model[row];
    cell.YearLabel.text = _Year[row];
    cell.ThumbImage.image = [UIImage imageNamed:_Images[row]];*/
    garageCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    PFObject *tempobject=[obj objectAtIndex:indexPath.row];
    
    cell.MakeLabel.text = [tempobject objectForKey:@"make"];
    cell.ModelLabel.text =[tempobject objectForKey:@"model"];
    cell.YearLabel.text = [tempobject objectForKey:@"year"];
    cell.ThumbImage.image = [UIImage imageNamed:[tempobject objectForKey:@"photo"]];
    return cell;
}

/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([[segue identifier] isEqualToString:@"ShowDetails"]){
        detailViewController *detailviewcontroller = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        int row = [myIndexPath row];
        detailviewcontroller.DetailModal = @[_Make[row],_Model[row],_Year[row],_Images[row]];
    }
}*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
