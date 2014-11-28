#import "JRLabelTextView.h"
#import "JRComponents.h"

@implementation JRLabelTextView

@synthesize textView;


#pragma mark - Override Methods
-(void) initializeComponents: (NSDictionary*)config
{
    [super initializeComponents: config];
    
    textView = [[JRTextView alloc] init];
    [self addSubview: textView];
}

-(id) getValue {
    return [textView getValue];
}

-(void) setValue: (id)value {
    [textView setValue: value];
}

@end
