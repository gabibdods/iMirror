#import "AppDelegate.h"

#if TARGET_OS_IOS

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    UIViewController *rootVC = [[UIViewController alloc] init];
    UILabel *label = [[UILabel alloc] initWithFrame:rootVC.view.bounds];
    label.text = @"Hello World!";
    label.font = [UIFont systemFontOfSize:32];
    label.textAlignment = NSTextAlignmentCenter;
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [rootVC.view addSubview:label];

    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];

    return YES;
}

@end

#else

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    NSRect rect = NSMakeRect(0, 0, 400, 200);
    NSUInteger style = NSWindowStyleMaskTitled
                     | NSWindowStyleMaskClosable
                     | NSWindowStyleMaskResizable;
    self.window = [[NSWindow alloc] initWithContentRect:rect
                                              styleMask:style
                                                backing:NSBackingStoreBuffered
                                                  defer:NO];
    [self.window center];
    [self.window setTitle:@"Hello World App"];

    NSTextField *label = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 80, 400, 40)];
    [label setStringValue:@"Hello World!"];
    [label setBezeled:NO];
    [label setDrawsBackground:NO];
    [label setEditable:NO];
    [label setSelectable:NO];
    [label setAlignment:NSTextAlignmentCenter];
    [label setFont:[NSFont systemFontOfSize:24]];

    [[self.window contentView] addSubview:label];
    [self.window makeKeyAndOrderFront:nil];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end

#endif
