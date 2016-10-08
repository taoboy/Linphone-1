//
//  FastAddressBook.h
//  LinphoneDemo
//
//  Created by hao Mr Lin on 16/7/14.
//  Copyright © 2016年 hao Mr Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>
#import <UIKit/UIKit.h>

@interface FastAddressBook : NSObject {
    NSMutableDictionary* addressBookMap;
    
    ABAddressBookRef addressBook;
}

+ (BOOL)isSipURI:(NSString*)address;
+ (NSString*)getContactDisplayName:(ABRecordRef)contact;
+ (UIImage*)getContactImage:(ABRecordRef)contact thumbnail:(BOOL)thumbnail;
- (ABRecordRef)getContact:(NSString*)address;
- (void)reload;
- (void)saveAddressBook;
+ (BOOL)isAuthorized;
+ (NSString*)appendCountryCodeIfPossible:(NSString*)number;
+ (NSString*)normalizePhoneNumber:(NSString*)number;
+ (NSString*)normalizeSipURI:(NSString*)address;

@end
