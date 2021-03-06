//
//  FMDBStoreGenerator
//
//  Copyright (c) 2012 Kouji Ishii
//
//  This software is released under the MIT License.
//
//  http://opensource.org/licenses/mit-license.php
//

#import "KO2GeneratorStore.h"
#import "KO2Directory.h"

static NSString* const kSqlFilePath = @"generator.sqlFilePath";
static NSString* const kOutputDirectory = @"generator.outputDirectory";
static NSString* const kClassPrefix = @"generator.classPrefix";
static NSString* const kStoreClassSuffix = @"generator.storeClassSuffix";
static NSString* const kEntityClassSuffix = @"generator.entityClassSuffix";
static NSString* const kOverwriteCoreClass = @"generator.overwriteCoreClass";
static NSString* const kOverwriteStoreAndEntityClass = @"generator.overwriteStoreAndEntityClass";

@implementation KO2GeneratorStore

- (KO2Generator*) find{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    if(![defaults stringForKey:kSqlFilePath]){
        return nil;
    }
    
    KO2Generator *entity = [[KO2Generator alloc] init];
    
    entity.sqlFilePath = [defaults stringForKey:kSqlFilePath];
    entity.outputDirectory = [KO2Directory directoryWithOutputPath:[defaults stringForKey:kOutputDirectory]];
    entity.classPrefix = [defaults stringForKey:kClassPrefix];
    entity.storeClassSuffix = [defaults stringForKey:kStoreClassSuffix];
    entity.entityClassSuffix = [defaults stringForKey:kEntityClassSuffix];
    entity.overwriteCoreClass = [defaults boolForKey:kOverwriteCoreClass];
    entity.overwriteStoreAndEntityClass = [defaults boolForKey:kOverwriteStoreAndEntityClass];
    
    return entity;
}

- (BOOL) store:(KO2Generator*) entity
{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:entity.sqlFilePath forKey:kSqlFilePath];
    [defaults setObject:entity.outputDirectory.string forKey:kOutputDirectory];
    [defaults setObject:entity.classPrefix forKey:kClassPrefix];
    [defaults setObject:entity.storeClassSuffix forKey:kStoreClassSuffix];
    [defaults setObject:entity.entityClassSuffix forKey:kEntityClassSuffix];
    [defaults setBool:entity.overwriteCoreClass forKey:kOverwriteCoreClass];
    [defaults setBool:entity.overwriteStoreAndEntityClass forKey:kOverwriteStoreAndEntityClass];
    
    return YES;
}

@end
