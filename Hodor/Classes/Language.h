//
//  Language.h
//
//  Created by Aufree on 12/5/15.
//  Copyright (c) 2015 The EST Group. All rights reserved.
//

#import <Foundation/Foundation.h>

// replace the NSLocalizedString() in run time
#define kLang(key) [Language get:key alter:nil]
#define LanguageCode @[@"en", @"zh-Hans"]

@interface Language : NSObject

+ (void)initialize;
+ (void)setLanguage:(NSString *)language;
+ (NSString*)currentLanguageCode;
+ (void)userSelectedLanguage:(NSString *)selectedLanguage;
+ (NSString *)get:(NSString *)key alter:(NSString *)alternate;

@end
