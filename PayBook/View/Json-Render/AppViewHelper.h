#import <UIKit/UIKit.h>


@class JsonView;
@class AppWheelViewController;


@interface AppViewHelper : NSObject

#pragma mark -
+(NSString*) localizations: (NSString*)key, ... NS_REQUIRES_NIL_TERMINATION;
+(NSString*) localization: (NSString*)attribute;
+(NSString*) localization: (NSString*)attribute model:(NSString*)model;
+(NSMutableArray*) getKeyElements: (NSString*)longKey;


+(BOOL) isCurrentLanguageChinese;
+(BOOL) isCurrentLanguageEnglish;


#pragma mark - Refresh Localize By Selected Language

+(void) refreshLocalizeTextBySelectLanguage: (JsonView*)jsonview;


#pragma mark -

+(UIActivityIndicatorView*) showIndicatorInViewAndDisableInteraction: (UIView*)view;
+(UIActivityIndicatorView*) showIndicatorInView: (UIView*)view;
+(UIActivityIndicatorView*) stopIndicatorInViewAndEnableInteraction: (UIView*)view;
+(UIActivityIndicatorView*) stopIndicatorInView: (UIView*)view;



@end
