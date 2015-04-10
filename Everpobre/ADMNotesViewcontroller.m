//
//  ADMNotesViewcontroller.m
//  Everpobre
//
//  Created by Alberto Di Martino on 4/10/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMNotesViewcontroller.h"
#import "ADMNote.h"
#import "ADMPhoto.h"
#import "ADMNotebook.h"

@interface ADMNotesViewcontroller ()
@property (nonatomic,strong) ADMNotebook *notebook;
@end

@implementation ADMNotesViewcontroller

-(id) initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController style:(UITableViewStyle)aStyle notebook:(ADMNotebook *)notebook{
    
    if(self = [super initWithFetchedResultsController:aFetchedResultsController
                                                style:aStyle]){
        _notebook = notebook;
        self.title = notebook.name;
    }
    return self;
}

-(void) viewDidLoad{
    
    [super viewDidLoad];
    
}

//MEthod that generates the cell
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Find out which cell (note) they selected
    ADMNote *n = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //Create a cell
    static NSString *noteCell = @"noteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:noteCell];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:noteCell];
    }
    //syncronize note -> cell
    cell.textLabel.text = n.name;
    cell.imageView.image =n.photo.image;
    //return
    
    return cell;
}



@end
