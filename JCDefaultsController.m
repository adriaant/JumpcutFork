//
//  JKDefaultsController.m
//  JumpcutFork
//
//  Created by Dmitry Osipa on 18.11.12.
//
//

#import "JCDefaultsController.h"

static NSString* const kJKShortcutRecorderMainHotkey = @"ShortcutRecorderMainHotkey";
static NSString* const kJKHistoryItemsCount = @"HistoryItemsCount";
static NSString* const kJSStickyBezel = @"StickyBezel";
static NSString* const kJSDisplayCount = @"DisplayCount";
static NSString* const kJSMenuSelectionPastes = @"menuSelectionPastes";

@implementation JCDefaultsController

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        [JCDefaultsController registerDefaultValues];
    }
    return self;
}

- (void)dealloc
{
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)registerDefaultValues
{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{
                                            kJSDisplayCount: @15,
                              kJKShortcutRecorderMainHotkey: @{ @"keyCode" : @9,
                                                           @"modifierFlags":  @786432},
                                       kJKHistoryItemsCount: @40,
                                             kJSStickyBezel: @NO,
                                            kJSMenuSelectionPastes: @YES}
     ];
}

- (NSInteger)displayCount
{
    return [[[NSUserDefaults standardUserDefaults] valueForKey:kJSDisplayCount] integerValue];
}

- (void)setDisplayCount:(NSInteger)displayCount
{
    [[NSUserDefaults standardUserDefaults] setValue:@(displayCount) forKey:kJSDisplayCount];
}

- (NSDictionary*)shortcutRecorderMainHotkeyPlist
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kJKShortcutRecorderMainHotkey];
}

- (void)setShortcutRecorderMainHotkeyPlist:(NSDictionary*)plist
{
    [[NSUserDefaults standardUserDefaults] setValue:plist forKey:kJKShortcutRecorderMainHotkey];
}

- (NSInteger)historyItemsCount
{
    return [[[NSUserDefaults standardUserDefaults] valueForKey:kJKHistoryItemsCount] integerValue];
}

- (void)setHistoryItemsCount:(NSInteger)value
{
    [[NSUserDefaults standardUserDefaults] setValue:@(value) forKey:kJKHistoryItemsCount];
}

- (BOOL)isStickyBezel
{
    return [[[NSUserDefaults standardUserDefaults] valueForKey:kJSStickyBezel] boolValue];
}

- (void)setStickyBezel:(BOOL)value
{
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:kJSStickyBezel];
}

- (BOOL)isMenuSelectionPastes
{
    return [[[NSUserDefaults standardUserDefaults] valueForKey:kJSMenuSelectionPastes] boolValue];
}

- (void)setMenuSelectionPastes:(BOOL)value
{
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:kJSMenuSelectionPastes];
}

@end
