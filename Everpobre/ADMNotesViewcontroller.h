//
//  ADMNotesViewcontroller.h
//  Everpobre
//
//  Created by Alberto Di Martino on 4/10/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

@class ADMNotebook;

#import "AGTCoreDataTableViewController.h"


@interface ADMNotesViewcontroller : AGTCoreDataTableViewController

-(id) initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController style:(UITableViewStyle)aStyle notebook:(ADMNotebook *) notebook;

@end
