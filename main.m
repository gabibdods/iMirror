#import <TargetConditionals.h>

#if TARGET_OS_IOS
	#import <UIKit/UIKit.h>
#else
	#import <Cocoa/Cocoa.h>
#endif

#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
		#if TARGET_OS_IOS
			return UIApplicationMain(
				argc,
				argv,
				nil,
				NSStringFromClass([AppDelegate class])
			);
		#else
			NSApplication *app = [NSApplication sharedApplication];
			AppDelegate *delegate = [[AppDelegate alloc] init];
			[app setDelegate:delegate];
			[app run];
			return EXIT_SUCCESS;
		#endif
    }
}

// clang -fobjc-arc -framework Cocoa main.m -o HelloWorldApp
//./HelloWorldApp
