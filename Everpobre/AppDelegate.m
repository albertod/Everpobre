//
//  AppDelegate.m
//  Everpobre
//
//  Created by Alberto Di Martino on 4/7/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "AppDelegate.h"
#import "AGTCoreDataStack.h"
#import "ADMNotebook.h"
#import "ADMNote.h"
#import "ADMNotebooksViewController.h"
#import "UIViewController+Navigation.h"

@interface AppDelegate ()

@property (nonatomic,strong) AGTCoreDataStack *stack;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //Create isntance of the stack
    self.stack = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
    
    [self dummyData];
    
    //create fetch request
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[ADMNotebook entityName]];
    req.sortDescriptors =  @[[NSSortDescriptor
                             sortDescriptorWithKey:ADMNotebookAttributes.name
                             ascending:YES
                             selector:@selector(caseInsensitiveCompare:)],
                            [NSSortDescriptor
                             sortDescriptorWithKey:ADMNotebookAttributes.modificationDate
                                                          ascending:NO]]; //No ascending becuase we want the more recent first
    
    req.fetchBatchSize = 20;
    
    //fetch result controler
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc]
                                      initWithFetchRequest:req
                                      managedObjectContext:self.stack.context
                                      sectionNameKeyPath:nil
                                      cacheName:nil];
    
    //creta e acontroler
    ADMNotebooksViewController *nVC = [[ADMNotebooksViewController alloc]
                                       initWithFetchedResultsController:fc style:UITableViewStylePlain];
    

    
    
    //Categories: very util to expand and anvoid repetition of code
    //it is a way to add methods to a class pre-existent

    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
   
    self.window.rootViewController = [nVC wrappedInNavigation];
    [self.window makeKeyAndVisible];
  
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void) dummyData{
    
    //Delete all data previos data
    [self.stack zapAllData];
    
    // Creamos nuevos objectos
    ADMNotebook *exs = [ADMNotebook notebookWithName:@"Ex-novias" context:self.stack.context];

    [ADMNote noteWithName:@"mariana Davalos"
                 notebook:exs
                  context:self.stack.context];
    
    [ADMNote noteWithName:@"Camila Davalos"
                 notebook:exs
                  context:self.stack.context];
    
    [ADMNote noteWithName:@"Pampita"
                 notebook:exs
                  context:self.stack.context];
   
    ADMNote *vega = [ADMNote noteWithName:@"Maria teresa"
                 notebook:exs
                  context:self.stack.context];
    
    NSLog(@"Una Nota: %@",vega);
    
    //Buscar en CoreData --> we need an NSFeetchRequst object
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[ADMNote entityName]];
    
    //How sort () how sort, by witch criteria
    req.sortDescriptors = @[[NSSortDescriptor
                             sortDescriptorWithKey:ADMNoteAttributes.name
                             ascending:YES
                             selector:@selector(caseInsensitiveCompare:)],
                            [NSSortDescriptor sortDescriptorWithKey:ADMNoteAttributes.modificationDate
                                                          ascending:NO]]; //No ascending becuase we want the more recent first
    
    //Limit of result you want from a fetch search
    //req.fetchLimit = THE SIZE
    
    
    //the batch size of the receive
    //The chunk size you want to see
    req.fetchBatchSize = 20;
    
    //We need a predicat , that is an isntance of the NSpredicate to use it as a filter, all the elements that pass the filter, go to the array --> similar to SWL "where"
    
    req.predicate = [NSPredicate predicateWithFormat:@"notebook = %@",exs]; //all the notes that belong to the book exs will pass the filter
    
    //Execute the fetch request--> dont preocupate about erorr, hanldled by the mehtodf
    NSArray *results = [self.stack executeFetchRequest:req
                                            errorBlock:^(NSError *error) {
                                                NSLog(@"Error al buscar %@",error);
   
                                        }];
    
    //print the results from the fetch
    //this NSarray is not an array, you can check by po [results class] all of its object are not in memory
    //This is to save memory (It wont make senesor to have a 2M result array on memory for example)
    NSLog(@"Notes: %@",results);
    
    //hoe to deleta an object
    [self.stack.context deleteObject:vega];
    
    //Now save the chages that we made
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error when saving %@", error);
    }];
    
    
}

@end
