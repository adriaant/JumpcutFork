//
//  JCContext.h
//  JumpcutFork
//
//  Created by Dmitry Osipa on 18.11.12.
//
//

#import <Foundation/Foundation.h>

@class JCDefaultsController;

@interface JCContext : NSObject

@property (retain) JCDefaultsController* defaultsController;

+ (id)sharedInstance;

@end
