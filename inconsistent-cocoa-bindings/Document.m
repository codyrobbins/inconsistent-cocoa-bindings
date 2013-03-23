#import "Document.h"

@implementation Document

- (NSString *)windowNibName
{
  return(@"Document");
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
  return(nil);
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
  return(YES);
}

- (IBAction)toggleTopSubview:(id)sender
{
  if (self.isTopSubviewCollapsed)
    [self.splitview setPosition:50 ofDividerAtIndex:0];
  else
    [self.splitview setPosition:[self.splitview minPossiblePositionOfDividerAtIndex:0] ofDividerAtIndex:0];
}

- (IBAction)toggleBottomSubview:(id)sender
{
  if (self.isBottomSubviewCollapsed)
    [self.splitview setPosition:50 ofDividerAtIndex:0];
  else
    [self.splitview setPosition:[self.splitview maxPossiblePositionOfDividerAtIndex:0] ofDividerAtIndex:0];
}

- (BOOL)isTopSubviewCollapsed
{
  return([self.splitview isSubviewCollapsed:self.topSubview]);
}

- (BOOL)isBottomSubviewCollapsed
{
  return([self.splitview isSubviewCollapsed:self.bottomSubview]);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key
{
  if ([key isEqualToString:@"isTopSubviewCollapsed"] || [key isEqualToString:@"isBottomSubviewCollapsed"])
    return(NO);
  else
    return([super automaticallyNotifiesObserversForKey:key]);
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
  if (![key isEqualToString:@"isTopSubviewCollapsed"] && ![key isEqualToString:@"isBottomSubviewCollapsed"])
    [super setValue:value forUndefinedKey:key];
}

- (void)splitViewWillResizeSubviews:(NSNotification *)notification
{
  [self willChangeValueForKey:@"isTopSubviewCollapsed"];
  [self willChangeValueForKey:@"isBottomSubviewCollapsed"];
}

- (void)splitViewDidResizeSubviews:(NSNotification *)notification
{
  [self didChangeValueForKey:@"isBottomSubviewCollapsed"];
  [self didChangeValueForKey:@"isTopSubviewCollapsed"];
}

- (BOOL)splitView:(NSSplitView *)splitView canCollapseSubview:(NSView *)subview
{
  return(YES);
}

- (CGFloat)splitView:(NSSplitView *)splitView constrainMinCoordinate:(CGFloat)proposedMinimum ofSubviewAt:(NSInteger)dividerIndex
{
  return(proposedMinimum + 50);
}

- (CGFloat)splitView:(NSSplitView *)splitView constrainMaxCoordinate:(CGFloat)proposedMaximum ofSubviewAt:(NSInteger)dividerIndex
{
  return(proposedMaximum - 50);
}

@end