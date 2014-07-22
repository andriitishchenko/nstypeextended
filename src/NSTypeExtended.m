//
//  NSStringExtended.m
//
//  Created by AndruX on 11.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSTypeExtended.h"
#import <CommonCrypto/CommonDigest.h>
#import "UIImage+sizing.h"
@implementation NSString (Extended)

-(CGFloat)getTextHeightForFont:(UIFont*)font forWidth:(CGFloat)rect_width
{
    CGSize maxSize = CGSizeMake(ceilf(rect_width), CGFLOAT_MAX);
    CGSize expectSize = [self boundingRectWithSize: maxSize
                    options: NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin
                    attributes: @{ NSFontAttributeName : font }
                    context: nil].size;
    
    return ceilf(expectSize.height);
}

-(UIImage*)generateQR
{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    
    CIImage *outputImage = [filter outputImage];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:outputImage
                                       fromRect:[outputImage extent]];
    
    UIImage *image = [UIImage imageWithCGImage:cgImage
                                         scale:1.
                                   orientation:UIImageOrientationUp];
    
    UIImage *resized = [image resizeImageWithQuality:kCGInterpolationNone
                                                rate:5.0];
    return resized;
}

-(NSString *)urlEncode{
	return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                                               (CFStringRef)self,
                                                               NULL,
                                                               (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                               CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)));
}

-(NSString *) md5 {
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3], 
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ]; 
}
-(NSString *)base64
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:0];
}
-(NSString*)md5FileName
{
    NSString*fileName = [self lastPathComponent];            
    return [[fileName md5] stringByAppendingString:[NSString stringWithFormat:@".%@",[fileName pathExtension]]];
}
-(bool)isContainSubstring:(NSString*)_subtring
{
    if (self==nil || [self length]==0 || _subtring==nil || [_subtring length]==0 ) {
        return false;
    }else if ([[self lowercaseString] rangeOfString:_subtring].location != NSNotFound){
        return true;
    }else
    return false;

}


-(NSString*)extractFilename{
    return [[self lastPathComponent] stringByDeletingPathExtension];
}

-(NSString*)emptyForNil
{
    return self==nil?@"":self;
}

-(NSDictionary*)dictionaryWithLocalJSONPathString
{
    NSData* data = [NSData dataWithContentsOfFile:self ];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error != nil)
    {
        NSLog(@"dictionaryWithLocalJSONPathString\n%@ \n%@",self,error);
        return nil;
    }
    return result;
}

-(NSDictionary*)dictionaryWithRemoteJSONPathString
{
    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString: self] ];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error != nil)
    {
        NSLog(@"dictionaryWithRemoteJSONPathString\n%@ \n%@",self,error);
        return nil;
    }
    return result;
}

-(NSString*)toCachePath
{
    //NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [cachePath stringByAppendingPathComponent:self];
}

-(NSString*)toTmpPath
{
    return [NSTemporaryDirectory() stringByAppendingPathComponent:self];
}

-(NSString*)toDocuments
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? (NSString *)[paths objectAtIndex:0] : nil;
    return [basePath stringByAppendingPathComponent:self];
}

-(NSURL*)toURL
{

        NSURL *     result;
        NSString *  trimmedStr;
        NSRange     schemeMarkerRange;
        NSString *  scheme;
        
        assert(self != nil);
        
        result = nil;
        
        trimmedStr = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if ( (trimmedStr != nil) && (trimmedStr.length != 0) ) {
            schemeMarkerRange = [trimmedStr rangeOfString:@"://"];
            
            if (schemeMarkerRange.location == NSNotFound) {
                result = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", trimmedStr]];
            } else {
                scheme = [trimmedStr substringWithRange:NSMakeRange(0, schemeMarkerRange.location)];
                assert(scheme != nil);
                
                if ( ([scheme compare:@"http"  options:NSCaseInsensitiveSearch] == NSOrderedSame)
                    || ([scheme compare:@"https" options:NSCaseInsensitiveSearch] == NSOrderedSame) ) {
                    result = [NSURL URLWithString:trimmedStr];
                } else {
                    // It looks like this is some unsupported URL scheme.
                }
            }
        }
        
        return result;
}

-(NSString*)append:(NSString*)param, ...
{
    NSString* rez = self;
    id eachObject;
    va_list argumentList;
    if (param)
    {
        rez = [rez stringByAppendingString:param];
        va_start(argumentList, param);
        while ((eachObject = va_arg(argumentList, NSString*)))
            rez = [rez stringByAppendingString:eachObject];
        va_end(argumentList);
    }
    return rez;
}

+(NSString*)dateNow
{
    NSDate* date = [NSDate date];
    NSDateFormatter *dateFormatter =  [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"y-MM-d'T'HH:mm:ss.SSS'Z'"];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    NSString *datastring = [dateFormatter stringFromDate:date];
    //NSLog(@"todayString: %@", datastring);
    dateFormatter = nil;
    return datastring;
}

-(NSDate*)toDateWithFormat:(NSString*)format
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:format];
    return [dateFormatter dateFromString:self];
}

-(NSString*)newTMPWithExtension
{
    NSString*rez = [[NSString dateNow] toTmpPath];
    return [rez stringByAppendingPathExtension:self];
}

-(NSString*)newUniqueFileWithExtension
{
    return [[NSString dateNow] stringByAppendingPathExtension:self];
}

+(NSString*)guid
{
        NSString *  result;
        CFUUIDRef   uuid;
        CFStringRef uuidStr;
        
        uuid = CFUUIDCreate(NULL);
        assert(uuid != NULL);
        
        uuidStr = CFUUIDCreateString(NULL, uuid);
        assert(uuidStr != NULL);
        
        result = (__bridge NSString *)(uuidStr);
        assert(result != nil);
    
        CFRelease(uuidStr);
        CFRelease(uuid);
        
        return result;
}


@end

@implementation UIColor (Extended)
-(NSString *) toHEX
{
    return [NSString stringWithFormat:@"#%02X%02X%02X", (int)((CGColorGetComponents(self.CGColor))[0]*255.0), (int)((CGColorGetComponents(self.CGColor))[1]*255.0), (int)((CGColorGetComponents(self.CGColor))[2]*255.0)];
}
@end

@implementation NSDictionary (Extended)
-(NSData*)toJSONData
{
    NSError* error = nil;
    id result = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

-(NSString*)toJSONString
{
    NSError* error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
    if (error != nil) return nil;
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end

@implementation NSDate (Extended)
-(BOOL)isEarlyLastDays:(NSInteger)days
{
    NSDate *date = [[NSDate date] dateByAddingTimeInterval: -86400.0*days];
    return ([self compare:date] == NSOrderedAscending);
    
    // All intervals taken from Google
//    NSDate *yesterday = [today dateByAddingTimeInterval: -86400.0];
//    NSDate *thisWeek  = [today dateByAddingTimeInterval: -604800.0];
//    NSDate *lastWeek  = [today dateByAddingTimeInterval: -1209600.0];

}
-(NSDate*)maxDate:(NSDate*)compareDate
{
    if ([self compare:compareDate] == NSOrderedDescending) {
        //NSLog(@"date1 is later than date2");
        return self;
    }
    else
        return compareDate;
//    
//    } else if ([date1 compare:date2] == NSOrderedAscending) {
//        NSLog(@"date1 is earlier than date2");
//        
//    } else {
//        NSLog(@"dates are the same");
//        
//    }
}
- (NSString *) toStringWithFormat:(NSString*)format{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:self];
}

@end

@implementation NSObject (Extended)
-(NSData*)archive{
    return [NSKeyedArchiver archivedDataWithRootObject:self];
}
-(NSObject*)valueForNil:(NSObject*)value{
    return self==nil?value:self;
}

@end

@implementation NSData (Extended)
-(id)unArchive{
    return [NSKeyedUnarchiver unarchiveObjectWithData:self];
}

-(NSString*)toStringUTF8
{
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}
@end


@implementation NSIndexPath (Extended)
-(NSUInteger)hash{
    char str[11];
    int row = (int)self.row;
    int section = (int)self.section;
    sprintf(str, "%d%d", section,row);

    unsigned int val = 0;
    char *p;
    int i;
    p = str;
    for(i = 0; p[ i ]; i++){
        if (i ==0) {
            val = (unsigned char)p[i] << CHAR_BIT;
        }
        else
            val |= (unsigned char)p[i];
    }
    return val;
}
@end

//@implementation UIView (Extended)
//-(UIView*)clone{
//    UIView*newview = [[UIView alloc] initWithFrame:self.bounds];
//    newview = self;
//    return newview;
////    NSData *tmp = [NSKeyedArchiver archivedDataWithRootObject:self];
////    UIView *controller = [NSKeyedUnarchiver unarchiveObjectWithData:tmp];
////    return controller;
//}
//@end

@implementation NSArray (Extended)
-(NSArray*)findItemWithKey:(NSString*)key  Value:(NSObject*)Value{
    NSPredicate *p = [NSPredicate predicateWithFormat:@"%@=%@",key,Value];
    NSArray *filtered = [self filteredArrayUsingPredicate:p];
    return filtered;
}
-(NSObject*)findFirstItemWithKey:(NSString*)key  Value:(NSObject*)Value{
    NSArray*filtered = [self findItemWithKey:key Value:Value];
    if (filtered) {
        return filtered[0];
    }
    return 0;
}
-(BOOL)hasItemWithKey:(NSString*)key  Value:(NSObject*)Value
{
    NSArray*filtered = [self findItemWithKey:key Value:Value];
    if (filtered) {
        return YES;
    }
    return NO;
}
@end
