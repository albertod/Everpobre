#import "ADMNote.h"
#import "ADMPhoto.h"

@interface ADMNote ()

// Private interface goes here.

@end

@implementation ADMNote

#pragma mark - Class Methods

+(NSArray *) observableKeys{
    
    return @[ADMNoteAttributes.name,ADMNoteAttributes.text,ADMNoteRelationships.notebook, @"photo.photoData"];
}

+(instancetype) noteWithName:(NSString *) name
                    notebook:(ADMNotebook *) notebook
                     context:(NSManagedObjectContext *)context{
    
    ADMNote *note = [self insertInManagedObjectContext:context];
    //All the notes have to have a noptebook from the validations rules. (they are going to be applied when you save)
    note.name = name;
    note.notebook = notebook;
    note.photo = [ADMPhoto insertInManagedObjectContext:context];
    note.creationDate = [NSDate date];
    note.modificationDate = [NSDate date];
    
    return note;
    
}

#pragma mark - KVO

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    self.modificationDate = [NSDate date];
}

@end
