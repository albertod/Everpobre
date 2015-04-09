#import "_ADMNote.h"

@interface ADMNote : _ADMNote {}

+(instancetype) noteWithName:(NSString *) name notebook:(ADMNotebook *) notebook context:(NSManagedObjectContext *)context;

@end
