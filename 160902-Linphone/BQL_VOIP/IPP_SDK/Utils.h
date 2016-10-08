/* Utils.h
 *
 * Copyright (C) 2012  Belledonne Comunications, Grenoble, France
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or   
 *  (at your option) any later version.                                 
 *                                                                      
 *  This program is distributed in the hope that it will be useful,     
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of      
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the       
 *  GNU General Public License for more details.                
 *                                                                      
 *  You should have received a copy of the GNU General Public License   
 *  along with this program; if not, write to the Free Software         
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */

#import <UIKit/UIKit.h>

#ifndef LINPHONE_UTILS_H
#define LINPHONE_UTILS_H

#define DYNAMIC_CAST(x, cls)                        \
 ({                                                 \
    cls *inst_ = (cls *)(x);                        \
    [inst_ isKindOfClass:[cls class]]? inst_ : nil; \
 })

typedef enum _LinphoneLoggerSeverity {
    LinphoneLoggerDebug = 0,
    LinphoneLoggerLog,
    LinphoneLoggerWarning,
    LinphoneLoggerError,
    LinphoneLoggerFatal
} LinphoneLoggerSeverity;


@interface LinphoneLogger : NSObject {

}
+ (void)log:(LinphoneLoggerSeverity) severity format:(NSString *)format,...;
+ (void)logc:(LinphoneLoggerSeverity) severity format:(const char *)format,...;

@end

@interface LinphoneUtils : NSObject {

}

+ (BOOL)findAndResignFirstResponder:(UIView*)view;
+ (void)adjustFontSize:(UIView*)view mult:(float)mult;
+ (void)buttonFixStates:(UIButton*)button;
+ (void)buttonFixStatesForTabs:(UIButton*)button;
+ (void)buttonMultiViewAddAttributes:(NSMutableDictionary*)attributes button:(UIButton*)button;
+ (void)buttonMultiViewApplyAttributes:(NSDictionary*)attributes button:(UIButton*)button;

@end

@interface NSNumber (HumanReadableSize)

- (NSString*)toHumanReadableSize;

@end

void Linphone_log(NSString* format, ...) NS_FORMAT_FUNCTION(1,2);
void Linphone_dbg(NSString* format, ...) NS_FORMAT_FUNCTION(1,2);
void Linphone_warn(NSString* format, ...) NS_FORMAT_FUNCTION(1,2);
void Linphone_err(NSString* format, ...) NS_FORMAT_FUNCTION(1,2);
void Linphone_fatal(NSString* format, ...) NS_FORMAT_FUNCTION(1,2);



#endif
