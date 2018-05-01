//
//  UIView+Custom.m
//  ZakatFund
//
//  Created by Ahmed Osama on 1/29/14.
//  Copyright (c) 2014 asgatech. All rights reserved.
//

#import "UIView+Custom.h"

@implementation UIView (Custom)

- (void) setX:(CGFloat)x {
    
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void) setY:(CGFloat)y {
    
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}
- (void) setWidth:(CGFloat)width {
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
}
- (void) setHeight:(CGFloat)height {
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}
- (CGFloat) x {
    
    return self.frame.origin.x;
}
- (CGFloat) width {
    
    return self.frame.size.width;
}
- (CGFloat) height{
    
    return self.frame.size.height;
}
- (CGFloat) y {
    
    return self.frame.origin.y;
}

@end