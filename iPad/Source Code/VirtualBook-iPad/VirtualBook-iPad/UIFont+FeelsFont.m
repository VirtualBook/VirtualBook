//
//  UIFont+FeelsFont.m
//  feels
//
//  Created by Nghia Tran Vinh on 12/3/15.
//  Copyright © 2015 Nghia Tran Vinh. All rights reserved.
//

#import "UIFont+FeelsFont.h"

@implementation UIFont (FeelsFont)

/*
 2015-12-03 11:49:08.953 feels[8910:102177] SF UI Text: (
 "SFUIText-LightItalic",
 "SFUIText-HeavyItalic",
 "SFUIText-Bold",
 "SFUIText-Regular",
 "SFUIText-Italic",
 "SFUIText-Light",
 "SFUIText-MediumItalic",
 "SFUIText-Semibold",
 "SFUIText-BoldItalic",
 "SFUIText-SemiboldItalic",
 "SFUIText-Medium",
 "SFUIText-Heavy"
 )
 
 */


+(UIFont *) fontWithFeelsFont:(FeelsFont)feelsFont size:(CGFloat)fontSize
{
    switch (feelsFont) {
        case FeelsFont_SFUIText_Bold:
        {
            return [UIFont fontWithName:@"SFUIText-Bold" size:fontSize];
            
            break;
        }
        case FeelsFont_SFUIText_BoldItalic:
        {
            return [UIFont fontWithName:@"SFUIText-BoldItalic" size:fontSize];
            
            break;
        }
        case FeelsFont_SFUIText_Light:
        {
            return [UIFont fontWithName:@"SFUIText-Light" size:fontSize];
            
            break;
        }
        case FeelsFont_SFUIText_Heavy:
        {
            return [UIFont fontWithName:@"SFUIText-Heavy" size:fontSize];
            
            break;
        }
        case FeelsFont_SFUIText_HeavyItalic:
        {
            return [UIFont fontWithName:@"SFUIText-HeavyItalic" size:fontSize];
            
            break;
        }
        case FeelsFont_SFUIText_Italic:
        {
            return [UIFont fontWithName:@"SFUIText-Italic" size:fontSize];
            
            break;
        }
        case FeelsFont_SFUIText_LightItalic:
        {
            return [UIFont fontWithName:@"SFUIText-LightItalic" size:fontSize];
            
            break;
        }
        case FeelsFont_SFUIText_Medium:
        {
            return [UIFont fontWithName:@"SFUIText-Medium" size:fontSize];
            
            break;
        }
        case FeelsFont_SFUIText_MediumItalic:
        {
            return [UIFont fontWithName:@"SFUIText-MediumItalic" size:fontSize];
            
            break;
        }
        case FeelsFont_SFUIText_Regular:
        {
            return [UIFont fontWithName:@"SFUIText-Regular" size:fontSize];
            
            break;
        }
        case FeelsFont_SFUIText_Semibold:
        {
            return [UIFont fontWithName:@"SFUIText-Semibold" size:fontSize];
            
            break;
        }
        case FeelsFont_SFUIText_SemiBoldItaLic:
        {
            return [UIFont fontWithName:@"SFUIText-SemiboldItalic" size:fontSize];
            
            break;
        }
            
    }
}
@end
