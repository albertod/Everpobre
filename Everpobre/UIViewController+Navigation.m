//
//  UIViewController+Navigation.m
//  Everpobre
//
//  Created by Alberto Di Martino on 4/10/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)


-(UINavigationController *) wrappedInNavigation{
    
    UINavigationController *nVC = [UINavigationController new];
    [nVC pushViewController:self
                   animated:NO];
    
    return  nVC;
}

@end
