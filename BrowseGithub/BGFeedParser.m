//
//  BGFeedParser.m
//  BrowseGithub
//
//  Created by yaakaito on 12/08/28.
//
//

#import "BGFeedParser.h"
#import <KissXML/DDXML.h>

@implementation BGFeedParser

+ (NSArray *)parseFeedXMLData:(NSData *)xmlData error:(NSError *__autoreleasing *)error{
    
    DDXMLDocument *document = [[DDXMLDocument alloc] initWithData:xmlData options:0 error:error];
    
    return [NSArray array];
}
@end
