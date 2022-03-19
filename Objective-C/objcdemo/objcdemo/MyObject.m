//
//  MyObject.m
//  objcdemo
//
//  Created by whoami on 2022/3/19.
//

#import "MyObject.h"

@implementation MyObject

-(id)initWithProp:(int)intProp andProp:(NSString*)strProp{
    if(self = [super init])
    {
        _intProp = intProp;
        _strProp = strProp;
    }
    return self;
}

-(NSString*)toString{
    return [NSString stringWithFormat:@"intProp is %d, strProp is %@", self.intProp, self.strProp];
}

-(void)oneArgTest:(int)arg{
    NSLog(@"oneArgTest, arg is %d",arg);
}

-(void)twoArgTest:(int)arg1 with:(int)arg2{
    NSLog(@"twoArgTest, arg1 is %d, arg2 is %d",arg1, arg2);
}

- (void)fooWithArg:(int)arg{
    NSLog(@"fooWithArg, arg is %d",arg);
}

@end
