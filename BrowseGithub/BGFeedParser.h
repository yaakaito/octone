//
//  BGFeedParser.h
//  BrowseGithub
//
//  Created by yaakaito on 12/08/28.
//
//

#import <Foundation/Foundation.h>

@interface BGFeedParser : NSObject

+ (NSArray *)parseFeedXMLData:(NSData *)xmlData error:(NSError *__autoreleasing *)error;
@end
