//
//  BrowseGithub - BGGlobalMenuControllerSpec.m
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//
//  Created by: KAZUMA Ukyo
//

#import "Kiwi.h"
#import "BGGlobalMenuController.h"
#import "BGGlobalMenuContext.h"
#import "BGGlobalMenuContentCell.h"

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
    __block BGGlobalMenuController *globalMenuController;
    
    beforeEach(^{
        globalMenuController = [[BGGlobalMenuController alloc] init];
    });
    
    xit(@"は、メニューとブックマークの2つのメニュー階層から構築される", ^{
        NSInteger sections = [globalMenuController numberOfSectionsInTableView:nil];
        [[theValue(sections) should] equal:theValue(2)];
    });

    context(@"のメニュー", ^{
        BGGlobalMenuContext *contents = [BGGlobalMenuContext sharedContents];
        
        it(@"は、MenuContentsから構築される", ^{
            NSInteger rows = [globalMenuController tableView:nil numberOfRowsInSection:0];
            [[theValue(rows) should] equal:theValue([contents numberOfContents])];
            for(NSUInteger i = 0; i < rows; i++) {
                BGGlobalMenuContentCell *cell = (BGGlobalMenuContentCell*)[globalMenuController tableView:nil
                                                                                    cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i
                                                                                                                             inSection:0]];
                NSString *title = [contents contentsTitleForIndex:i];
                [[cell.textLabel.text should] equal:title];
            }
        });
    });
    
    context(@"のメニューを何かしら選択したとき", ^{
        __block MockMenuDelegate *mockDelegate;
        beforeAll(^{
            mockDelegate= [[MockMenuDelegate alloc] init];
            globalMenuController.delegate = mockDelegate;
        });

        it(@"は、delegateへ通知を送る", ^{
            [globalMenuController tableView:nil didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            [[theValue(mockDelegate.calledDelegate) should] beYes];
        });
    });
});

SPEC_END
