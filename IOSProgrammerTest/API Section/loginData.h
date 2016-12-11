



#import <Foundation/Foundation.h>

@interface loginData : NSObject

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *message;

- (void)loadWithDictionary:(NSDictionary *)dict;
@end
