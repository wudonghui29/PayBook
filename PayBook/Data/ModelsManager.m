//
//  ModelsManager.m
//  PayBook
//
//  Created by isaacs on 11/29/14.
//  Copyright (c) 2014 wudonghui. All rights reserved.
//

#import "ModelsManager.h"
#import "ClassesInterface.h"


@implementation ModelsManager


+(ModelsManager*) getInstance
{
    static ModelsManager* manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ModelsManager alloc] init];
    });
    return manager;
}




#pragma mark - Public Methods

-(BOOL) save: (NSDictionary*)values entityName:(NSString*)entityName
{
    NSManagedObjectContext* context = DATA.manageObjectContext;
    
    NSManagedObjectModel *managedObjectModel = [[context persistentStoreCoordinator] managedObjectModel];
    NSEntityDescription *entity = [[managedObjectModel entitiesByName] objectForKey:entityName];
    NSManagedObject *model = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
//    id model = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:context];
    
    for (NSString* name in values) {
        id value = values[name];
        [model setValue: value forKey:name];
    }
    NSError* error = nil;
    BOOL isSaved =  [context save:&error];
    return isSaved;
}


-(void) delete: (id)obj
{
    
}


@end
