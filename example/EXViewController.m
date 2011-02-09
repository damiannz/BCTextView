#import "EXViewController.h"
#import "BCTextView.h"

@implementation EXViewController

- (void)viewDidLoad {
//	BCTextView *textView = [[[BCTextView alloc] initWithHTML:
//							 [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"] 
//													   encoding:NSUTF8StringEncoding 
//														  error:NULL]]
//							  
//							autorelease];
	
	BCTextView *textView = [[BCTextView alloc] initWithHTML: @"<b>The Presidents of The United States of America</b> with <b>Tall Stories</b> and 5 more"];
	[textView autorelease];
	
	textView.fontSize = 14;
	textView.frame = self.view.bounds;
	textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	textView.backgroundColor = [UIColor clearColor];

	self.view.backgroundColor = [UIColor redColor];
	[self.view addSubview:textView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return YES;
}

@end
