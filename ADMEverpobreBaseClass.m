//
//  ADMEverpobreBaseClass.m
//  Everpobre
//
//  Created by Alberto Di Martino on 4/9/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "ADMEverpobreBaseClass.h"

@implementation ADMEverpobreBaseClass


#pragma mark - Class methods

+(NSArray*) observableKeys{
    
 
    return @[];
}

-(void) awakeFromInsert{
    
    [super awakeFromInsert];
    
    [self setupKVO];
    
    
}

-(void) awakeFromFetch{
    
    //It is called n time during the live of the object
    [self awakeFromFetch];
    
    [self setupKVO];
    
}

-(void) willTurnIntoFault{
    
    [super willTurnIntoFault];
    
    //Produce when object is empty converted into fault
    //remove notification
    [self tearDownKVO];
    
}


#pragma mark - KVO

-(void) setupKVO{
    
    //Observ all properties EXECPT modification date
    for(NSString *key in [[self class] observableKeys] ){
        
        [self addObserver:self
               forKeyPath:key
                  options:NSKeyValueObservingOptionOld |
         NSKeyValueObservingOptionNew
                  context:NULL];
        
    }
    
}


-(void) tearDownKVO{
    
    for(NSString *key in [[self class] observableKeys]){
        
        [self removeObserver:self
                  forKeyPath:key];
    }
}


@end
