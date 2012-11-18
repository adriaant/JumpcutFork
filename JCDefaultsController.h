//
//  JKDefaultsController.h
//  JumpcutFork
//
//  Created by Dmitry Osipa on 18.11.12.
//
//

#import <Foundation/Foundation.h>

@interface JCDefaultsController : NSObject

- (NSInteger)displayCount;
- (NSDictionary*)shortcutRecorderMainHotkeyPlist;
- (NSInteger)historyItemsCount;
- (BOOL)isStickyBezel;
- (BOOL)isMenuSelectionPastes;

@end
