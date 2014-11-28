#import "JRGradientLabel.h"
#import "JRComponents.h"

@implementation JRGradientLabel
{
    NSString* _attribute ;
}

#pragma mark - JRComponentProtocal Methods

-(void) initializeComponents: (NSDictionary*)config
{
}

-(NSString*) attribute
{
    return _attribute;
}

-(void) setAttribute: (NSString*)attribute
{
    _attribute = attribute;
}


-(void) subRender: (NSDictionary*)dictionary {
    
    if (dictionary) {
        
        [JsonViewHelper setLabelFontAttribute: self config:dictionary];
        self.font = [self.font fontWithSize: [FrameTranslater convertFontSize: self.font.pointSize]];
        
//        self.font = [FontHelper getFontFromTTFFile: @"simhei_2.ttf" withSize:40];
    }
}

-(id) getValue {
    return self.text;
}

-(void) setValue: (id)value {
    self.text = value;
}



@end
