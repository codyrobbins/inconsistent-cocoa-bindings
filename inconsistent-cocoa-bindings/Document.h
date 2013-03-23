@interface Document : NSDocument <NSSplitViewDelegate>

@property IBOutlet NSSplitView *splitview;
@property IBOutlet NSView *topSubview;
@property IBOutlet NSView *bottomSubview;

- (IBAction)toggleTopSubview:(id)sender;
- (IBAction)toggleBottomSubview:(id)sender;
- (BOOL)isTopSubviewCollapsed;
- (BOOL)isBottomSubviewCollapsed;

@end