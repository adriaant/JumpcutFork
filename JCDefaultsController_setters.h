//
//  JKDefaultsController_setters.h
//  JumpcutFork
//
//  Created by Dmitry Osipa on 18.11.12.
//
//

#import "JCDefaultsController.h"

@interface JKDefaultsController ()

- (void)setDisplayCount:(NSInteger)displayCount;
- (void)setShortcutRecorderMainHotkeyPlist:(NSDictionary*)plist;
- (void)setHistoryItemsCount:(NSInteger)value;
- (void)setStickyBezel:(BOOL)value;
- (void)setMenuSelectionPastes:(BOOL)value;

@end
