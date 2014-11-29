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

- (NSError*)updateModel:(NSString*)entityName identification:(NSString*)identification values:(NSDictionary*)values
{
    NSManagedObjectContext* context = DATA.manageObjectContext;
    
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:context]];
    [request setPredicate:[NSPredicate predicateWithFormat:@"identification like[cd] %@",identification]];
    
    //https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/Predicates/Articles/pCreating.html
    NSError *error = nil;
    NSArray *result = [context executeFetchRequest:request error:&error];
    id model = [result firstObject];
    for (NSString* name in values) {
        id value = values[name];
        [model setValue: value forKey:name];
    }
    
    if ([context save:&error]) {
        return nil;
    }
    return error;
}


-(NSArray*) getModelsByEntityName:(NSString*)entityName
{
    NSManagedObjectContext* context = DATA.manageObjectContext;

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    return fetchedObjects;
}


-(id)getModel: (NSString*)entityName identification:(NSString*)identification
{
    NSManagedObjectContext* context = DATA.manageObjectContext;
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setIncludesPropertyValues:NO];
    [request setEntity:entity];
    
    NSError *error = nil;
    NSArray *datas = [context executeFetchRequest:request error:&error];
    if (!error && datas && [datas count]) {
        
        for (NSManagedObject *obj in datas)
        {
            NSString* identity = [obj valueForKey:@"identification"];
            if ([identification isEqualToString:identity]) {
                return obj; 
            }
        }
    }
    return nil;
}

-(NSError*)deleteModel: (NSString*)entityName identification:(NSString*)identification
{
    NSManagedObjectContext* context = DATA.manageObjectContext;
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setIncludesPropertyValues:NO];
    [request setEntity:entity];
    
    NSError *error = nil;
    NSArray *datas = [context executeFetchRequest:request error:&error];
    if (!error && datas && [datas count]) {
        
        for (NSManagedObject *obj in datas)
        {
            NSString* identity = [obj valueForKey:@"identification"];
            if ([identification isEqualToString:identity]) {
                [context deleteObject:obj];
                
                if (![context save:&error])
                {
                    return error;
                }  
                break;
            }
        }
    }
    return nil;
}

@end
