//
//  BGRepository.h
//  BrowseGithub
//
//  Created by yaakaito on 12/09/16.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "BGGithubResource.h"

@interface BGRepository : BGGithubResource

@property (nonatomic, strong)

+ (id)repositoryWithJSON:(id)json;
+ (id)repositorywithFullName:(id)fullName;
@end
