//
//  LevelTableViewController.m
//  ELEC2660 Logic Game
//
//  Created by Johnny Mitchell on 23/11/2017.
//  Copyright © 2017 Johnny Mitchell. All rights reserved.
//

#import "LevelTableViewController.h"

@interface LevelTableViewController ()

@end

@implementation LevelTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = [[DataModel alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated {
    //When the view appears, reload the data to update whether the level has been completed or not
    NSLog(@"TableViewLoaded");
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSInteger numberOfRows;
    
    if (section == 0) {
        numberOfRows = self.data.levels.count;
    }
    return numberOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LevelCell" forIndexPath:indexPath];
    
    // Configure the cell...
    bool levelComplete = false;
    if (indexPath.section == 0) {
        Level *tempLevel = [self.data.levels objectAtIndex:indexPath.row];
        cell.textLabel.text = tempLevel.levelName;
        levelComplete = tempLevel.complete;
        //Code learned from https://stackoverflow.com/questions/19634426/how-to-save-nsmutablearray-in-nsuserdefaults
        //Read level complete data from userDefaults
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *levelNum = [NSString stringWithFormat:@"%d",(int)tempLevel.levelNumber];
        BOOL levelComplete = [userDefaults boolForKey:levelNum];
        if (levelComplete) {
            //Disable Cell
            cell.detailTextLabel.text = @"Complete!";
            //cell.userInteractionEnabled = false;
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
            cell.textLabel.enabled = false;
        } else {
            cell.detailTextLabel.text = @"";
            cell.selectionStyle = UITableViewCellSelectionStyleBlue;
            cell.textLabel.enabled = true;
        }
    }
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"levelSegue"]) {
        LevelViewController *destinationViewController = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        if (indexPath.section == 0) {
            Level *tempLevel = [self.data.levels objectAtIndex:indexPath.row];
            destinationViewController.level = tempLevel;
        }
    }
}


@end
