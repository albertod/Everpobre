#import "_ADMNote.h"
#import "ADMPhoto.h"

@interface ADMNote : _ADMNote {}

+(instancetype) noteWithName:(NSString *) name notebook:(ADMNotebook *) notebook context:(NSManagedObjectContext *)context;

@end
