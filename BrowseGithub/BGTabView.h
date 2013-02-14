//
//  BGTabView.h
//  octone
//
//  Created by yaakaito on 2013/02/12.
//  Copyright (c) 2013年 yaakaito. All rights reserved.
//

#import "BGView.h"

@protocol BGTabViewDelegate
- (UIView *)viewForIndex:(NSUInteger)index;
@end

@interface BGTabView : BGView
@property (nonatomic, weak) NSObject<BGTabViewDelegate> *delegate;
@end
