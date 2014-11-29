//
//  ModelsManager.h
//  PayBook
//
//  Created by isaacs on 11/29/14.
//  Copyright (c) 2014 wudonghui. All rights reserved.
//


#define MODELS [ModelsManager getInstance]

#import <Foundation/Foundation.h>

@interface ModelsManager : NSObject


+(ModelsManager*) getInstance;


-(BOOL) save: (NSDictionary*)values entityName:(NSString*)entityName;

@end
