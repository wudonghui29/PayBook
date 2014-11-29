#import <Foundation/Foundation.h>


@class NSManagedObjectModel;
@class NSManagedObjectContext;
@class NSPersistentStoreCoordinator;


@interface DataManager : NSObject



// core data begin

@property (nonatomic, strong, readonly) NSManagedObjectModel* manageObjectModel;
@property (nonatomic, strong, readonly) NSManagedObjectContext* manageObjectContext;
@property (nonatomic, strong, readonly) NSPersistentStoreCoordinator* persistentStoreCoordinator;

// core data end



@end
