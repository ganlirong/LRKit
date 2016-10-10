//
//  BaseModel.m
//  MiDou
//
//  Created by 甘立荣 on 12-12-22.
//  Copyright (c) 2013年 www.midou8.com. All rights reserved.
//

#import "BaseModel.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation BaseModel

-(id)initWithDataDic:(NSDictionary*)data{
    
	if (self = [super init]) {
		[self setAttributes:data];
	}
    
	return self;
    
}

-(NSDictionary*)attributeMapDictionary{
    
	return nil;
    
}

/**
 *  根据属性名称获取他的set方法
 *
 *  @param attributeName
 *
 *  @return
 */
-(SEL)getSetterSelWithAttibuteName:(NSString*)attributeName {
    
	NSString *capital = [[attributeName substringToIndex:1] uppercaseString];
	NSString *setterSelStr = [NSString stringWithFormat:@"set%@%@:",capital,[attributeName substringFromIndex:1]];
	return NSSelectorFromString(setterSelStr);
    
}

- (NSString *)customDescription{
	return nil;
}

- (NSString *)description{
    
	NSMutableString *attrsDesc = [NSMutableString stringWithCapacity:100];
	NSDictionary *attrMapDic = [self attributeMapDictionary];
	NSEnumerator *keyEnum = [attrMapDic keyEnumerator];
	id attributeName;
	
	while ((attributeName = [keyEnum nextObject])) {
        
		SEL getSel = NSSelectorFromString(attributeName);
        
		if ([self respondsToSelector:getSel]) {
            
			NSMethodSignature *signature = nil;
			signature = [self methodSignatureForSelector:getSel];
			NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
			[invocation setTarget:self];
			[invocation setSelector:getSel];
			NSObject *valueObj = nil;
			[invocation invoke];
			[invocation getReturnValue:&valueObj];
//            ITTDINFO(@"attributeName %@ value %@", attributeName, valueObj);
			if (valueObj) {
				[attrsDesc appendFormat:@" [%@=%@] ",attributeName, valueObj];
			} else {
				[attrsDesc appendFormat:@" [%@=nil] ",attributeName];
			}
			
		}
	}
	
	NSString *customDesc = [self customDescription];
	NSString *desc;
	
	if (customDesc && [customDesc length] > 0 ) {
		desc = [NSString stringWithFormat:@"%@:{%@,%@}",[self class],attrsDesc,customDesc];
	} else {
		desc = [NSString stringWithFormat:@"%@:{%@}",[self class],attrsDesc];
	}
    
	return desc;
}

-(void)setAttributes:(NSDictionary*)dataDic {
    
    //拿到对象和字典对应的值,如果对象字段和字典的key相同就不需要集成此方法
	NSDictionary *attrMapDic = [self attributeMapDictionary];
    
	if (!attrMapDic && dataDic && ![dataDic isKindOfClass:[NSNull class]] && dataDic.count > 0) { //如果为空说明对象的字段和字典的key一一对应
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[dataDic count]];
        for (NSString *key in dataDic) {
            [dic setValue:key forKey:key];
        }
        attrMapDic = dic;
	}
    
	NSEnumerator *keyEnum = [attrMapDic keyEnumerator];
	id attributeName;
    
	while ((attributeName = [keyEnum nextObject])) {
		SEL sel = [self getSetterSelWithAttibuteName:attributeName];//获取set方法名
        Method method = class_getInstanceMethod([self class], sel);
        char *tempString = method_copyArgumentType(method, 2);
        NSString *typeString = [NSString stringWithFormat:@"%s", tempString];
		if ([self respondsToSelector:sel]) {
			NSString *dataDicKey = [attrMapDic objectForKey:attributeName];
            id attributeValue = [dataDic objectForKey:dataDicKey];
            if (attributeValue && ![attributeValue isKindOfClass:[NSNull class]]) {
                if ([typeString isEqualToString:@"d"]) {
                    double doubleValue = [attributeValue doubleValue];
                    void (*objc_msgSendTyped)(id self, SEL _cmd, double value) = (void*)objc_msgSend;
                    objc_msgSendTyped(self, sel, doubleValue);
                } else if ([typeString isEqualToString:@"i"]) {
                    NSInteger intValue = [attributeValue integerValue];
                    void (*objc_msgSendTyped)(id self, SEL _cmd, NSInteger value) = (void*)objc_msgSend;
                    objc_msgSendTyped(self, sel, intValue);
                } else if ([typeString isEqualToString:@"I"]) {
                    long uintValue = [attributeValue longValue];
                    void (*objc_msgSendTyped)(id self, SEL _cmd, long value) = (void*)objc_msgSend;
                    objc_msgSendTyped(self, sel, uintValue);
                } else if ([typeString isEqualToString:@"L"]) {
                    long longValue = [attributeValue longValue];
                    void (*objc_msgSendTyped)(id self, SEL _cmd, long value) = (void*)objc_msgSend;
                    objc_msgSendTyped(self, sel, longValue);
                } else if ([typeString isEqualToString:@"q"] ||
                           [typeString isEqualToString:@"Q"]) {
                    long long longValue = [attributeValue longLongValue];
                    void (*objc_msgSendTyped)(id self, SEL _cmd, long long value) = (void*)objc_msgSend;
                    objc_msgSendTyped(self, sel, longValue);
                } else if ([typeString isEqualToString:@"f"]) {
                    CGFloat floatValue = [attributeValue floatValue];
                    void (*objc_msgSendTyped)(id self, SEL _cmd, CGFloat value) = (void*)objc_msgSend;
                    objc_msgSendTyped(self, sel, floatValue);
                } else if ([typeString isEqualToString:@"B"]) {
                    BOOL boolValue = [attributeValue boolValue];
                    void (*objc_msgSendTyped)(id self, SEL _cmd, BOOL value) = (void*)objc_msgSend;
                    objc_msgSendTyped(self, sel, boolValue);
                } else {
                    void (*objc_msgSendTyped)(id self, SEL _cmd, id value) = (void*)objc_msgSend;
                    objc_msgSendTyped(self, sel, attributeValue);
                }
            }
            
//			[self performSelectorOnMainThread:sel 
//                                   withObject:attributeValue 
//                                waitUntilDone:[NSThread isMainThread]];
//            
		}
        
	}
    
}


- (id)initWithCoder:(NSCoder *)decoder{
    
	if( self = [super init] ){
        
		NSDictionary *attrMapDic = [self attributeMapDictionary];
        
		if (attrMapDic == nil) {
            
			return self;
            
		}
        
		NSEnumerator *keyEnum = [attrMapDic keyEnumerator];
        
		id attributeName;
        
		while ((attributeName = [keyEnum nextObject])) {
            
			SEL sel = [self getSetterSelWithAttibuteName:attributeName];
            
			if ([self respondsToSelector:sel]) {
                
				id obj = [decoder decodeObjectForKey:attributeName];
                
				[self performSelectorOnMainThread:sel 
                                       withObject:obj
                                    waitUntilDone:[NSThread isMainThread]];
                
			}
            
		}
        
	}
    
	return self;
    
}
- (void)encodeWithCoder:(NSCoder *)encoder{
    
	NSDictionary *attrMapDic = [self attributeMapDictionary];
    
	if (attrMapDic == nil) {
        
		return;
        
	}
    
	NSEnumerator *keyEnum = [attrMapDic keyEnumerator];
	id attributeName;
    
	while ((attributeName = [keyEnum nextObject])) {
        
		SEL getSel = NSSelectorFromString(attributeName);
        
		if ([self respondsToSelector:getSel]) {
            
			NSMethodSignature *signature = nil;
			signature = [self methodSignatureForSelector:getSel];
			NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
			[invocation setTarget:self];
			[invocation setSelector:getSel];
			NSObject *valueObj = nil;
			[invocation invoke];
			[invocation getReturnValue:&valueObj];
			
			if (valueObj) {
                
				[encoder encodeObject:valueObj forKey:attributeName];
                
			}
            
		}
        
	}
    
}

- (NSData*)getArchivedData{
    
	return [NSKeyedArchiver archivedDataWithRootObject:self];
    
}

- (NSString *)cleanString:(NSString *)str {
    
    if (str == nil) {
        return @"";
    }
    
    NSMutableString *cleanString = [NSMutableString stringWithString:str];
    [cleanString replaceOccurrencesOfString:@"\n" withString:@"" 
                                    options:NSCaseInsensitiveSearch 
                                      range:NSMakeRange(0, [cleanString length])];
    [cleanString replaceOccurrencesOfString:@"\r" withString:@"" 
                                    options:NSCaseInsensitiveSearch 
                                      range:NSMakeRange(0, [cleanString length])];    
    return cleanString;
}

#ifdef _FOR_DEBUG_  
-(BOOL) respondsToSelector:(SEL)aSelector {  
//    printf("SELECTOR: %s\n", [NSStringFromSelector(aSelector) UTF8String]);  
    return [super respondsToSelector:aSelector];  
}  
#endif

@end
