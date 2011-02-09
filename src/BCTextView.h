@class BCTextFrame;

@interface BCTextView : UIView {
	BCTextFrame *textFrame;
	NSArray *linkHighlights;
}

- (id)initWithHTML:(NSString *)html;
- (UIImage *)imageForURL:(NSString *)URL;

@property (nonatomic) CGFloat fontSize;

// DS: added this property for the ability to change text color
@property (nonatomic, retain) UIColor *textColor;

@end
