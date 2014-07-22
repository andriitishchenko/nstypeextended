//
//  Created by AndruX on 11.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSObject (Extended)
-(NSData*)archive;
-(NSObject*)valueForNil:(NSObject*)value;
@end

@interface NSString (Extended)
-(NSString *)urlEncode;
-(NSString *)md5;
-(NSString *)base64;
-(NSString*)md5FileName;
-(bool)isContainSubstring:(NSString*)_subtring;
-(NSString*)extractFilename;
-(NSString*)emptyForNil;
-(NSDictionary*)dictionaryWithLocalJSONPathString;
-(NSDictionary*)dictionaryWithRemoteJSONPathString;
-(NSURL*)toURL;
-(NSString*)toCachePath;
-(NSString*)toTmpPath;
-(NSString*)toDocuments;
-(NSString*)append:(NSString*)param, ...;
+(NSString*)dateNow;
-(NSString*)newTMPWithExtension;
-(NSString*)newUniqueFileWithExtension;
+(NSString*)guid;
-(NSDate*)toDateWithFormat:(NSString*)format;
-(CGFloat)getTextHeightForFont:(UIFont*)font forWidth:(CGFloat)rect_width;
-(UIImage*)generateQR;

@end

@interface UIColor (Extended)
-(NSString *)toHEX;
@end

@interface NSDictionary (Extended)
-(NSData*)toJSONData;
-(NSString*)toJSONString;
@end

@interface NSDate (Extended)
-(BOOL)isEarlyLast:(NSInteger)days;
-(NSDate*)maxDate:(NSDate*)compareDate;
- (NSString *) toStringWithFormat:(NSString*)format;
@end

@interface NSData (Extended)
-(NSString*)toStringUTF8;
-(id)unArchive;
@end

@interface UIImage (Extended)

@end


@interface NSIndexPath (Extended)
-(NSUInteger)hash;
@end

//@interface UIView (Extended)
//-(UIView*)clone;
//@end

@interface NSArray (Extended)
-(NSArray*)findItemWithKey:(NSString*)key Value:(NSObject*)Value;
-(NSObject*)findFirstItemWithKey:(NSString*)key  Value:(NSObject*)Value;
-(BOOL)hasItemWithKey:(NSString*)key Value:(NSObject*)Value;
@end