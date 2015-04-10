//
//  ADMNotebooksViewController.m
//  Everpobre
//
//  Created by Alberto Di Martino on 4/9/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMNotebooksViewController.h"
#import "ADMNotebook.h"

@interface ADMNotebooksViewController ()

@end

@implementation ADMNotebooksViewController

-(void) viewDidLoad{
    
    [super viewDidLoad];
    
    self.title = @"Everpobre";
}

-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //Find out which is the Notebook
    ADMNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //Create a cell
    static  NSString *cellID = @"notebookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:cellID];
    }
    //Configure it (syncronize notebook --> cell)
    cell.textLabel.text = nb.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)[nb.notes count] ];
    //Return it
    return cell;
    
    

}

@end
