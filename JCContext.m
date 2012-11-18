//
//  JCContext.m
//  JumpcutFork
//
//  Created by Dmitry Osipa on 18.11.12.
//
//

#import "JCContext.h"
#import "JCDefaultsController.h"

@implementation JCContext

+ (id)sharedInstance
{
    static id sSharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sSharedInstance = [[JCContext alloc] init];
    });
    return sSharedInstance;
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        self.defaultsController = [[JCDefaultsController alloc] init];
    }
    return self;
}

@end
