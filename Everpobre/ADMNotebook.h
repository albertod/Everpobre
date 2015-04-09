#import "_ADMNotebook.h"

@interface ADMNotebook : _ADMNotebook {}

+(instancetype) notebookWithName:(NSString *)name
                         context:(NSManagedObjectContext *) context;

@end
