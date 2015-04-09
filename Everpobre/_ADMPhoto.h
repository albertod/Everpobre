// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADMPhoto.h instead.

@import CoreData;
#import "ADMEverpobreBaseClass.h"

extern const struct ADMPhotoAttributes {
	__unsafe_unretained NSString *photoData;
} ADMPhotoAttributes;

extern const struct ADMPhotoRelationships {
	__unsafe_unretained NSString *notes;
} ADMPhotoRelationships;

@class ADMNote;

@interface ADMPhotoID : NSManagedObjectID {}
@end

@interface _ADMPhoto : ADMEverpobreBaseClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ADMPhotoID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _ADMPhoto (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(ADMNote*)value_;
- (void)removeNotesObject:(ADMNote*)value_;

@end

@interface _ADMPhoto (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
