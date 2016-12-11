


#import "loginData.h"

@implementation loginData
- (void)loadWithDictionary:(NSDictionary *)dict
{
    self.code = [dict objectForKey:@"code"];
    self.message = [dict objectForKey:@"message"];
}
@end
