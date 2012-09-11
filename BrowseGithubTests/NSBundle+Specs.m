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

+ (NSData *)atomForResourceName:(NSString *)resourceName {
    
    return [NSData dataWithContentsOfFile:[[NSBundle bundleForClass:[BGBundle class]] pathForResource:resourceName ofType:@"atom"]];
}

+(NSData *)jsonForResourceName:(NSString *)resourceName {
    
    return [NSData dataWithContentsOfFile:[[NSBundle bundleForClass:[BGBundle class]] pathForResource:resourceName ofType:@"json"]];
}

+ (id)jsonObjectForResourceName:(NSString *)resourceName {

    NSData *jsonData = [self jsonForResourceName:resourceName];
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:NULL];
}
@end
