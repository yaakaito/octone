//
//  UIApplication+Spec.m
//  BrowseGithub
//
//  Created by yaakaito on 12/09/11.
//
//

#import "UIApplication+Spec.h"
#import <objc/runtime.h>

@interface UIApplication(Spec)
@property (nonatomic) SEL realOpenURLSelector;
@property (nonatomic) SEL fakeOpenURLSelector;
@end

@implementation UIApplication (Spec)

+ (void)swapInstanceMethodsForClass: (Class) cls selector: (SEL)sel1 andSelector: (SEL)sel2 {
    Method method1 = class_getInstanceMethod(cls, sel1);
    Method method2 = class_getInstanceMethod(cls, sel2);
    method_exchangeImplementations(method1, method2);
}

- (void)spec_openURL:(NSURL*)url {
    self.openedURL = url;
}


- (void)swapOpenURL {
    if(!self.realOpenURLSelector) {
        self.realOpenURLSelector = @selector(openURL:);
        self.fakeOpenURLSelector = @selector(spec_openURL);
    }
    
    [[self class] swapInstanceMethodsForClass:[UIApplication class]
                                     selector:self.realOpenURLSelector
                                  andSelector:self.fakeOpenURLSelector];
}



@end
