//
//  Created by AndruX on 11.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSObject (Extended)

/**
 *  Convert NSObject to NSData with NSKeyedArchiver
 *
 *  @return NSData
 */
-(NSData*)toData;

/**
 *  Check object value if nil.
 *
 *  @param value default value
 *
 *  @return object or default value
 */
-(NSObject*)valueForNil:(NSObject*)value;
@end

@interface NSString (Extended)

/**
 *  Validate string url
 *
 *  @return BOOL
 */
-(BOOL)isValidURL;

/**
 *  Convert string to url encoded string
 *
 *  @return NSString
 */
-(NSString *)urlEncode;

/**
 *  Calculate md5 sum
 *
 *  @return string of md5
 */
-(NSString *)md5;

/**
 *  base64 encoder
 *
 *  @return base64 string
 */
-(NSString *)base64;

/**
 *  get filename as md5 string from path
 *
 *  @return md5 filename string
 */
-(NSString*)md5FileName;

/**
 *  check if string contains substring
 *
 *  @param _subtring searching string
 *
 *  @return true/false
 */
-(bool)isContainSubstring:(NSString*)_subtring;

/**
 *  extracting filename from path
 *
 *  @return filename string
 */
-(NSString*)extractFilename;

/**
 *  generate @"" string for if nil
 *
 *  @return empty string @""
 */
-(NSString*)emptyForNil;

/**
 *  JSON with filepath to NSDictionary
 *
 *  @return NSDictionary object or nil
 */
-(NSDictionary*)dictionaryWithLocalJSONPathString;

/**
 *  JSON with string URL to NSDictionary
 *
 *  @return NSDictionary object or nil
 */
-(NSDictionary*)dictionaryWithRemoteJSONPathString;

/**
 *  NSString to NSURL. http[s] autoadded
 *
 *  @return NSURL object
 */
-(NSURL*)toURL;

/**
 *  appending path to NSCachesDirectory
 *
 *  @return new string cache path
 */
-(NSString*)toCachePath;

/**
 *  NSTemporaryDirectory append path
 *
 *  @return new string tmp path
 */
-(NSString*)toTmpPath;

/**
 *  NSDocumentDirectory append path
 *
 *  @return new string Documents path
 */
-(NSString*)toDocuments;

/**
 *  NSString generating [@"one" append:string, string, nil]
 *
 *  @param param list of items
 *
 *  @return <#return value description#>
 */
-(NSString*)append:(NSString*)param, ...;

/**
 *  NSString date with format:
 y-MM-d'T'HH:mm:ss.SSS'Z'"
 *
 *  @return current date string
 */
+(NSString*)dateNow;

/**
 *  generate tmp filepath
 *
 *  @return string path
 */
-(NSString*)newTMPWithExtension;

/**
 *  generate filename with format:
 @"y-MM-d'T'HH:mm:ss.SSS'Z'"+ filename
 *
 *  @return datetimefilename string
 */
-(NSString*)newUniqueFileWithExtension;

/**
 *  Generate CFUUID string
 *
 *  @return CFUUID string
 */
+(NSString*)guid;

/**
 *  Create NSDate with format
 *
 *  @param format string fromat
 *
 *  @return NSDate object
 */
-(NSDate*)toDateWithFormat:(NSString*)format;

/**
 *  Calculate heigth of text for font with container width
 *
 *  @param font       UIFont for calc
 *  @param rect_width expected text width
 *
 *  @return CGFloat heigth
 */
-(CGFloat)getTextHeightForFont:(UIFont*)font forWidth:(CGFloat)rect_width;

/**
 *  NSStrig to QR Code
 *
 *  @return UIImage
 */
-(UIImage*)generateQR;

@end

@interface UIColor (Extended)
/**
 *  UIColor to web HEX color
 *
 *  @return string hex color
 */
-(NSString *)toHEX;
@end

@interface NSDictionary (Extended)
/**
 *  Convert NSDictionary to NSData
 *
 *  @return NSData or nil
 */
-(NSData*)toJSON;

/**
 *  Convert NSDictionary to NSString
 *
 *  @return JSON string
 */
-(NSString*)toJSONString;

-(NSData*)toData;
-(NSString*)queryString;
@end

@interface NSDate (Extended)
/**
 *  Compare date to days
 *
 *  @param days NSInteger days
 *
 *  @return BOOL
 */
-(BOOL)isEarlyLastDays:(NSInteger)days;

/**
 *  Select max of 2 dates
 *
 *  @param compareDate compare date
 *
 *  @return NSDate
 */
-(NSDate*)maxDate:(NSDate*)compareDate;

/**
 *  NSDate to string
 *
 *  @param format string format
 *
 *  @return string
 */
- (NSString *) toStringWithFormat:(NSString*)format;
@end

@interface NSData (Extended)
/**
 *  NSData to NSString
 *
 *  @return NSString
 */
-(NSString*)toStringUTF8;

/**
 *  NSData to object with NSKeyedUnarchiver
 *
 *  @return object
 */
-(id)unArchive;

-(NSDictionary*)toDictionary;

-(NSString*)toMD5;
@end

@interface NSIndexPath (Extended)
/**
 *  calculate hash for comparition
 *
 *  @return NSUInteger hash
 */
-(NSUInteger)hash;
@end

//@interface UIView (Extended)
//-(UIView*)clone;
//@end

@interface NSArray (Extended)
/**
 *  Search objects in array by key=value
 *
 *  @param key   key-name
 *  @param Value key-value
 *
 *  @return NSArray
 */
-(NSArray*)findItemWithKey:(NSString*)key Value:(NSObject*)Value;

/**
 *  Search and return first item for search condition
 *
 *  @param key   key-name
 *  @param Value key-value
 *
 *  @return NSObject
 */
-(NSObject*)findFirstItemWithKey:(NSString*)key  Value:(NSObject*)Value;

/**
 *  Check if NSArray contains value for key
 *
 *  @param key   key-name
 *  @param Value key-value
 *
 *  @return NSObject
 */
-(BOOL)hasItemWithKey:(NSString*)key Value:(NSObject*)Value;
@end