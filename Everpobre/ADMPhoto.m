#import "ADMPhoto.h"

@interface ADMPhoto ()

// Private interface goes here.

@end

@implementation ADMPhoto

-(void) setImage:(UIImage *) image{
    
  //convert UIIamge to NS data (what CoreData understand)

    self.photoData = UIImageJPEGRepresentation(image, 0.9);
}

-(UIImage *)image{
    
    return [UIImage imageWithData:self.photoData];
}

@end
