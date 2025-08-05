#import <TargetConditionals.h>

#if TARGET_OS_IOS
	@interface AppDelegate : UIResponder <UIApplicationDelegate>
	@property (strong, nonatomic) UIWindow *window;
#else
	@interface AppDelegate : NSObject <NSApplicationDelegate>
	@property (strong) NSWindow *window;
#endif

@end
