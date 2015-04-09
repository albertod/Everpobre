#import "ADMNotebook.h"

@interface ADMNotebook ()

// Private interface goes here.

@end

@implementation ADMNotebook


+(NSArray *) observableKeys{
    
    return @[ADMNotebookAttributes.name , ADMNotebookRelationships.notes];
}


+(instancetype) notebookWithName:(NSString *)name
                         context:(NSManagedObjectContext *) context{
    
    ADMNotebook *nb = [self insertInManagedObjectContext:context];
    nb.name = name;
    nb.creationDate = [NSDate date];
    nb.modificationDate = [NSDate date];
    
    return nb;
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    self.modificationDate = [NSDate date];
    
}






@end
