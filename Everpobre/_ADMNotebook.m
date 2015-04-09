// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ADMNotebook.m instead.

#import "_ADMNotebook.h"

const struct ADMNotebookAttributes ADMNotebookAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.name = @"name",
};

const struct ADMNotebookRelationships ADMNotebookRelationships = {
	.notes = @"notes",
};

@implementation ADMNotebookID
@end

@implementation _ADMNotebook

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"NoteBook" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"NoteBook";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"NoteBook" inManagedObjectContext:moc_];
}

- (ADMNotebookID*)objectID {
	return (ADMNotebookID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic name;

@dynamic notes;

- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];

	[self didAccessValueForKey:@"notes"];
	return result;
}

@end

