//
//  BrowseGithub - BGGlobalMenuControllerSpec.m
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//  Created by: KAZUMA Ukyo
//

#import "Kiwi.h"
#import "BGGlobalMenuController.h"

@interface MockMenuDelegate : NSObject<BGGlobalMenuControllerDelegate>
@property(nonatomic) BOOL calledDelegate;
@property(nonatomic, retain) UIViewController *nextController;
@end

@implementation MockMenuDelegate
- (void)globalMenuController:(id)sender didSelectNextViewController:(UIViewController *)viewController
{
    self.calledDelegate = YES;
    self.nextController= viewController;
}
@end


SPEC_BEGIN(BGGlobalMenuControllerSpec)

describe(@"Global Menu Controller", ^{
    context(@"メニューの選択", ^{
        __block BGGlobalMenuController *globalMenuController;
        __block MockMenuDelegate *mockDelegate;
        beforeEach(^{
            globalMenuController = [[BGGlobalMenuController alloc] init];
            mockDelegate= [[MockMenuDelegate alloc] init];
            globalMenuController.delegate = mockDelegate;
        });
        
        it(@"何かしらのメニューがタップで選択されたとき、delegateへ通知される", ^{
            [globalMenuController tableView:nil didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            [[theValue(mockDelegate.calledDelegate) should] beYes];
        });
    });
});

SPEC_END
