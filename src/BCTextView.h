@class BCTextFrame;

@interface BCTextView : UIView
{
	BCTextFrame *textFrame;
	NSArray *linkHighlights;
}

- (id)initWithHTML:(NSString *)html;
- (UIImage *)imageForURL:(NSString *)URL;

@property (nonatomic) CGFloat fontSize;

/*!
 @updated 8 Feb 2011 by DS
 Added this property for the ability to change text color.
 */
@property (nonatomic, retain) UIColor *textColor;
@property (nonatomic, readonly) BCTextFrame *textFrame;

@end
