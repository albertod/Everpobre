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
    [self addNewNotebookButton];
    
    //edit button
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
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

//to delete a row
-(void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete) {
       
        NSManagedObject *managedObject = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [self.fetchedResultsController.managedObjectContext deleteObject:managedObject];
        [self.fetchedResultsController.managedObjectContext save:nil];
        
    }
    
}


#pragma mark - Utils

-(void) addNewNotebookButton{
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                         target:self
                                                                         action:@selector(addNewNotebook:)];
    
    self.navigationItem.rightBarButtonItem = add;
}

#pragma mark - Actions

-(void) addNewNotebook:(id) sender{
    
    //to add a new notebook, we just have to modify the model
    //CoreData will know that the context has changed, so it would update it
    
    //All CoreDataObjcts know the context they are
    [ADMNotebook notebookWithName:@"Nueva Libreta"
                          context:self.fetchedResultsController.managedObjectContext];
    
}

@end
