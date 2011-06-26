#import "BCTextView.h"
#import "BCTextFrame.h"

@interface BCTextView (/* Private */)

@property (nonatomic, retain) NSArray *linkHighlights;

@end

@implementation BCTextView

@synthesize textFrame, linkHighlights, linkHighlightColor;

- (id)initWithHTML:(NSString *)html
{
	if ((self = [super init]))
	{
		textFrame = [[BCTextFrame alloc] initWithHTML:html];
		textFrame.delegate = (id <BCTextFrameDelegate>)self;
		self.linkHighlightColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
	}
	
	return self;
}

- (void)dealloc
{
	[textFrame release];
	[linkHighlights release];
	self.linkHighlightColor = nil;

	[super dealloc];
}

- (UIColor *) textColor
{
	return self.textFrame.textColor;
}

- (void) setTextColor: (UIColor *) theColor
{
	self.textFrame.textColor = theColor;
}

- (void)drawRect:(CGRect)rect {
	[super drawRect:rect];
	[[UIColor blackColor] set];
	[self.textFrame drawInRect:self.bounds];
}

- (void)setFrame:(CGRect)aFrame {
	[super setFrame:aFrame];
	self.textFrame.width = aFrame.size.width;
	[self setNeedsDisplay];
}

- (void)setFontSize:(CGFloat)aFontSize {
	self.textFrame.fontSize = aFontSize;
}

- (CGFloat)fontSize {
	return self.textFrame.fontSize;
}

- (UIImage *)imageForURL:(NSString *)URL {
	return [UIImage imageNamed:@"emot-sweden.gif"];
}

- (void)clearHighlightFrames
{
	for (UIView *v in self.linkHighlights) {
		[v removeFromSuperview];
	}
	[self.linkHighlights removeAllObjects];
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint point = [[touches anyObject] locationInView:self];
	[self.textFrame touchBeganAtPoint:point];
	[self setNeedsDisplay];
	[super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint point = [[touches anyObject] locationInView:self];
	[self.textFrame touchEndedAtPoint:point];
	[self setNeedsDisplay];
	[super touchesEnded:touches withEvent:event];
	
	[self clearHighlightFrames];
	
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	[self.textFrame touchCancelled];
	[self setNeedsDisplay];
	[super touchesCancelled:touches withEvent:event];

	[self clearHighlightFrames];
}

- (void)link:(NSValue *)link touchedInRects:(NSArray *)rects {
	NSMutableArray *views = [NSMutableArray arrayWithCapacity:rects.count];
	for (NSValue *v in rects) {
		CGRect r = [v CGRectValue];
		UIView *view = [[[UIView alloc] initWithFrame:r] autorelease];
		view.backgroundColor = linkHighlightColor;
		[self addSubview:view];
		[views addObject:view];
	}
	self.linkHighlights = views;
}

- (void)link:(NSValue *)link touchedUpInRects:(NSArray *)rects {
	for (UIView *v in self.linkHighlights) {
		[v removeFromSuperview];
	}
}

@end
