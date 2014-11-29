#import "DataManager.h"
#import "ClassesInterface.h"


@implementation DataManager



@synthesize manageObjectModel;
@synthesize manageObjectContext;
@synthesize persistentStoreCoordinator;



+(DataManager*) getInstance
{
    static DataManager* manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DataManager alloc] init];
    });
    return manager;
}




#pragma mark - Core Data Intialize

-(NSManagedObjectModel *)manageObjectModel
{
    if (! manageObjectModel) {
        manageObjectModel = [NSManagedObjectModel mergedModelFromBundles: nil];
    }
    return manageObjectModel;
}

-(NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (! persistentStoreCoordinator) {
        
        persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: self.manageObjectModel];
        
        NSError* error = nil;
        NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString* appPahtInDoc = [docPath stringByAppendingPathComponent: @"App"];
        NSString* modelsSqlitePath = [appPahtInDoc stringByAppendingPathComponent: @"Models.sqlite"];
        
        [FileManager createFolderWhileNotExist: modelsSqlitePath];
        DLog(@"SQLITE : %@", modelsSqlitePath);
        
        NSURL* storeURL = [NSURL fileURLWithPath: modelsSqlitePath];
        if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
            NSLog(@"Error : %@ , %@", error, error.userInfo);
        }
    }
    return persistentStoreCoordinator;
}

-(NSManagedObjectContext *)manageObjectContext
{
    if (! manageObjectContext) {
        manageObjectContext = [[NSManagedObjectContext alloc] init];
        [manageObjectContext setPersistentStoreCoordinator: self.persistentStoreCoordinator];
    }
    return manageObjectContext;
}





@end
