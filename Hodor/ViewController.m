//
//  ViewController.m
//  Hodor
//
//  Created by Aufree on 12/1/15.
//  Copyright © 2015 aufree. All rights reserved.
//

#import "ViewController.h"
#import "Language.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *helloWorldLabel;
@property (weak, nonatomic) IBOutlet UIImageView *colaImageView;
@property (strong, nonatomic) NSMutableString *currentLanguage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _currentLanguage = [[Language currentLanguageCode] mutableCopy];
    [self reloadUI];
}

- (void)reloadUI {
    self.navigationItem.title = kLang(@"I18n Demo");
    _helloWorldLabel.text = kLang(@"Hello World");
    [_colaImageView setImage:[UIImage imageNamed:kLang(@"coca_cola")]];
    [self createRightBarItem];
}

- (void)createRightBarItem {
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:kLang(@"Toggle") style:UIBarButtonItemStylePlain target:self action:@selector(changeLanguage)];
    rightBarButtonItem.tintColor = [UIColor colorWithRed:0.008 green:0.633 blue:0.890 alpha:1.000];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

- (void)changeLanguage {
    
    if ([_currentLanguage isEqualToString:LanguageCode[0]]) {
        _currentLanguage = LanguageCode[1];
    } else if ([_currentLanguage isEqualToString:LanguageCode[1]]) {
        _currentLanguage = LanguageCode[0];
    }
    
    [Language userSelectedLanguage:_currentLanguage];
    
    [self reloadUI];
}

@end
