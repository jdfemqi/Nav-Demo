//
//  President.m
//  Nav
//
//  Created by qiujian on 16/1/23.
//  Copyright © 2016年 qiujian. All rights reserved.
//

#import "President.h"

@implementation President
@synthesize number;
@synthesize name;
@synthesize fromYear;
@synthesize toYear;
@synthesize party;

#pragma mark - 
#pragma mark NSCoding
-(void)encodeWithCoder:(NSCoder*)coder
{
    [coder encodeInt:self.number forKey:kPresidentNumberKey];
    [coder encodeObject:self.name forKey:kPresidentNameKey];
    [coder encodeObject:self.fromYear forKey:kPresidentFromKey];
    [coder encodeObject:self.toYear forKey:kPresidentToKey];
    [coder encodeObject:self.party forKey:kPresidentPartyKey];
}

-(id)initWithCoder:(NSCoder*)coder
{
    if (self = [super init]) {
        self.number = [coder decodeIntForKey:kPresidentNumberKey];
        self.name = [coder decodeObjectForKey:kPresidentNameKey];
        self.fromYear = [coder decodeObjectForKey:kPresidentFromKey];
        self.toYear = [coder decodeObjectForKey:kPresidentToKey];
        self.party = [coder decodeObjectForKey:kPresidentPartyKey];
    }
    
    return  self;
}

@end
