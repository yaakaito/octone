//
//  BGAuthenticationController.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/01.
//
//

#import <UIKit/UIKit.h>

@protocol BGAuthenticationControllerDelegate
- (void)authenticationController:(id)controller didAuthenticated:(BOOL)success;
@end

@interface BGAuthenticationController : UIViewController
@property (nonatomic, weak) NSObject<BGAuthenticationControllerDelegate> *delegate;
@end
