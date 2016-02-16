//
//  President.h
//  Nav
//
//  Created by qiujian on 16/1/23.
//  Copyright © 2016年 qiujian. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kPresidentNumberKey     @"President"
#define kPresidentNameKey       @"Name"
#define kPresidentFromKey       @"FromYear"
#define kPresidentToKey         @"ToYear"
#define kPresidentPartyKey      @"Party"

@interface President : NSObject <NSCoding>
@property int number;
@property (nonatomic, retain)NSString* name;
@property (nonatomic, retain)NSString* fromYear;
@property (nonatomic, retain)NSString* toYear;
@property (nonatomic, retain)NSString* party;
@end
