//
//  JumpcutClipping.m
//  Jumpcut
//  http://jumpcut.sourceforge.net/
//
//  Created by steve on Sun Jan 12 2003.
//  Copyright (c) 2003-2006 Steve Cook
//  Permission is hereby granted, free of charge, to any person obtaining a 
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the 
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included 
//  in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE  WARRANTIES OF 
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
//  NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
//  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
//  OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR 
//  THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "JumpcutClipping.h"

@implementation JumpcutClipping

- (id) init
{
    self = [self initWithContents:@"" withType:@"" withDisplayLength:40];
    if (self != nil)
    {
        
    }
    return self;
}

- (id) initWithContents:(NSString *)contents withType:(NSString *)type withDisplayLength:(int)displayLength
{
    self = [super init];
    if (self != nil)
    {
        clipContents = [[NSString alloc] init];
        clipDisplayString = [[NSString alloc] init];
        clipType = [[NSString alloc] init];

        [self setContents:contents setDisplayLength:displayLength];
        [self setType:type];
        [self setHasName:false];
    }
    return self;
}

/* - (id)initWithCoder:(NSCoder *)coder
{
    NSString * newContents;
    int newDisplayLength;
    NSString *newType;
    BOOL newHasName;
    if ( self = [super init]) {
        newContents = [NSString stringWithString:[coder decodeObject]];
        [coder decodeValueOfObjCType:@encode(int) at:&newDisplayLength];
        newType = [NSString stringWithString:[coder decodeObject]];
        [coder decodeValueOfObjCType:@encode(BOOL) at:&newHasName];
        [self 	     setContents:newContents
                setDisplayLength:newDisplayLength];
        [self setType:newType];
        [self setHasName:newHasName];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    int codeDisplayLength = [self displayLength];
    BOOL codeHasName = [self hasName];
    [coder encodeObject:[self contents]];
    [coder encodeValueOfObjCType:@encode(int) at:&codeDisplayLength];
    [coder encodeObject:[self type]];
    [coder encodeValueOfObjCType:@encode(BOOL) at:&codeHasName];
} */

- (void) setContents:(NSString *)newContents setDisplayLength:(int)newDisplayLength
{
    clipContents = newContents;
    if ( newDisplayLength  > 0 ) {
        clipDisplayLength = newDisplayLength;
    }
   [self resetDisplayString];
}

- (void) setContents:(NSString *)newContents
{
    clipContents = newContents;
    [self resetDisplayString];
}

- (void) setType:(NSString *)newType
{
    clipType = newType;
}

- (void) setDisplayLength:(int)newDisplayLength
{
    if ( newDisplayLength  > 0 ) {
        clipDisplayLength = newDisplayLength;
        [self resetDisplayString];
    }
}

- (void) setHasName:(BOOL)newHasName
{
        clipHasName = newHasName;
}

- (void) resetDisplayString
{
    NSString *newDisplayString, *firstLineOfClipping;
	NSUInteger start, lineEnd, contentsEnd;
	NSRange startRange = NSMakeRange(0,0);
	NSRange contentsRange;
	// We're resetting the display string, so release the old one.
	// We want to restrict the display string to the clipping contents through the first line break.
	[clipContents getLineStart:&start end:&lineEnd contentsEnd:&contentsEnd forRange:startRange];
	contentsRange = NSMakeRange(0, contentsEnd);
	firstLineOfClipping = [clipContents substringWithRange:contentsRange];
    if ( [firstLineOfClipping length] > clipDisplayLength ) {
        newDisplayString = [[NSString stringWithString:[firstLineOfClipping substringToIndex:clipDisplayLength]] stringByAppendingString:@"..."];   
    } else {
        newDisplayString = [NSString stringWithString:firstLineOfClipping];
    }
    clipDisplayString = newDisplayString;
}

- (NSString *) description
{
    NSString *description = [[super description] stringByAppendingString:@": "];
    description = [description stringByAppendingString:[self displayString]];   
    return description;
}

- (NSString *) contents
{
//    NSString *returnClipContents;
//    returnClipContents = [NSString stringWithString:clipContents];
//    return returnClipContents;
    return clipContents;
}

- (int) displayLength
{
    return clipDisplayLength;
}

- (NSString *) type
{
    return clipType;
}

- (NSString *) displayString
{
    // QUESTION
    // Why doesn't the below work?
    // NSString *returnClipDisplayString;
    // returnClipDisplayString = [NSString stringWithString:clipDisplayString];
    // return returnClipDisplayString;
    return clipDisplayString;
}

- (BOOL) hasName
{
    return clipHasName;
}

- (void) dealloc
{
    clipDisplayLength = 0;
    clipHasName = 0;
}
@end
