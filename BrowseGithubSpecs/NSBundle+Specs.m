//
//  NSBundle+Specs.m
//  BrowseGithub
//
//  Created by yaakaito on 12/08/28.
//
//

#import "NSBundle+Specs.h"

// use bundle for class fix
@interface BGBundle : NSObject
@end

@implementation BGBundle
@end

@implementation NSBundle (Specs)

+ (NSData *)atomForResouceName:(NSString *)resouceName {
    
    return [NSData dataWithContentsOfFile:[[NSBundle bundleForClass:[BGBundle class]] pathForResource:resouceName ofType:@"atom"]];
}
@end
