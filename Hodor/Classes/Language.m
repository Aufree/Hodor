//
//  Language.h
//
//  Created by Aufree on 12/5/15.
//  Copyright (c) 2015 The EST Group. All rights reserved.
//

#import "Language.h"

@implementation Language

static NSBundle *bundle = nil;

NSString *const LanguageCodeIdIndentifier = @"LanguageCodeIdIndentifier";

+ (void)initialize {
     NSString *current = @"zh-Hans";
    [self setLanguage:current];
}

+ (void)setLanguage:(NSString *)language {
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];
}

+ (NSString *)currentLanguageCode {
    NSString *userSelectedLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCodeIdIndentifier];
    if (userSelectedLanguage) {
        // Store selected language in local
        
        return userSelectedLanguage;
    }
    
    NSString *systemLanguage = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
    if ([systemLanguage isEqualToString:@"en"] || [systemLanguage isEqualToString:@"zh-Hans"]) {
        // Update selected language in local
    } else {
        // Update selected language in local
    }
    
    return systemLanguage;
}

+ (void)userSelectedLanguage:(NSString *)selectedLanguage {
    // Store the data
    // Store selected language in local
    
    [[NSUserDefaults standardUserDefaults] setObject:selectedLanguage forKey:LanguageCodeIdIndentifier];
    [[NSUserDefaults standardUserDefaults] synchronize];

    // Set global language
    [Language setLanguage:selectedLanguage];
}

+ (NSString *)get:(NSString *)key alter:(NSString *)alternate {
    return [bundle localizedStringForKey:key value:alternate table:nil];
}

@end
