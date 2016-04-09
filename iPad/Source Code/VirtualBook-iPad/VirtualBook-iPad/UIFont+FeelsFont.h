//
//  UIFont+FeelsFont.h
//  feels
//
//  Created by Nghia Tran Vinh on 12/3/15.
//  Copyright © 2015 Nghia Tran Vinh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FeelsFont) {
    FeelsFont_SFUIText_LightItalic = 0,
    FeelsFont_SFUIText_HeavyItalic,
    FeelsFont_SFUIText_Bold,
    FeelsFont_SFUIText_Regular,
    FeelsFont_SFUIText_Italic,
    FeelsFont_SFUIText_MediumItalic,
    FeelsFont_SFUIText_Semibold,
    FeelsFont_SFUIText_BoldItalic,
    FeelsFont_SFUIText_SemiBoldItaLic,
    FeelsFont_SFUIText_Medium,
    FeelsFont_SFUIText_Heavy,
    FeelsFont_SFUIText_Light
};

@interface UIFont (FeelsFont)

+(UIFont *) fontWithFeelsFont:(FeelsFont) feelsFont size:(CGFloat) fontSize;

@end
