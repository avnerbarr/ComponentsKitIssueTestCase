//
//  ViewController.m
//  ComponentsKitIssues
//
//  Created by Avner Barr on 7/11/17.
//  Copyright © 2017 Avner Barr. All rights reserved.
//

#import "ViewController.h"
#import <ComponentKit/ComponentKit.h>
@interface ViewController ()

@end

@implementation UIButton (ComponentsExtension)

- (void)xxx_SetNumberOfLines:(int)lines
{
  self.titleLabel.numberOfLines = lines;
}

- (void)xxx_setTextAlignment:(NSTextAlignment)alignment
{
  self.titleLabel.textAlignment = alignment;
}

@end
@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  CKComponentFlexibleSizeRangeProvider *prov = [CKComponentFlexibleSizeRangeProvider providerWithFlexibility:CKComponentSizeRangeFlexibleWidthAndHeight];
  CKComponentHostingView *hv = [[CKComponentHostingView alloc] initWithComponentProvider:self.class sizeRangeProvider:prov];
  hv.frame = self.view.bounds;
  [hv updateModel:@"sdf" mode:CKUpdateModeSynchronous];
  [self.view addSubview:hv];
  
}


+ (CKComponent *)componentForModel:(id<NSObject>)model context:(id<NSObject>)context
{
  
  CKButtonComponent *singleLineWithInsets =  [CKButtonComponent newWithTitles:{
    {UIControlStateNormal,@"Single line with insets"}
  }titleColors:{
    {UIControlStateNormal,[UIColor redColor]}
  } images:{
    
  } backgroundImages:{
    
  } titleFont:nil selected:NO enabled:YES action:nil size:{} attributes:{
    {@selector(setBackgroundColor:),[UIColor blueColor]},
    {@selector(setContentEdgeInsets:),[NSValue valueWithUIEdgeInsets:{10,10,10,10}]}
    
  }accessibilityConfiguration:{
    
  }];
  
  CKButtonComponent *multiline =  [CKButtonComponent newWithTitles:{
    {UIControlStateNormal,@"Multi line\n no insets and has wrong padding"}
  }titleColors:{
    {UIControlStateNormal,[UIColor redColor]}
  } images:{
    
  } backgroundImages:{
    
  } titleFont:nil selected:NO enabled:YES action:nil size:{} attributes:{
    {@selector(setBackgroundColor:),[UIColor blueColor]},
    
  }accessibilityConfiguration:{
    
  }];
  
  CKButtonComponent *multilineWithCategoryExtensionNumberOfLinesCall =  [CKButtonComponent newWithTitles:{
    {UIControlStateNormal,@"Multi line\nwrong padding"}
  }titleColors:{
    {UIControlStateNormal,[UIColor redColor]}
  } images:{
    
  } backgroundImages:{
    
  } titleFont:nil selected:NO enabled:YES action:nil size:{} attributes:{
    {@selector(setBackgroundColor:),[UIColor greenColor]},
    {@selector(xxx_SetNumberOfLines:),@0}
    
  }accessibilityConfiguration:{
    
  }];
  
  
  CKButtonComponent *multilineWithCategoryExtensionNumberOfLinesAndAlignmentCall =  [CKButtonComponent newWithTitles:{
    {UIControlStateNormal,@"Multi line\nwith text alignemnt"}
  }titleColors:{
    {UIControlStateNormal,[UIColor redColor]}
  } images:{
    
  } backgroundImages:{
    
  } titleFont:nil selected:NO enabled:YES action:nil size:{} attributes:{
    {@selector(setBackgroundColor:),[UIColor yellowColor]},
    {@selector(xxx_SetNumberOfLines:),@0},
    {@selector(xxx_setTextAlignment:),@(NSTextAlignmentCenter)}
    
  }accessibilityConfiguration:{
    
  }];
  
  
  
  CKButtonComponent *multilineWithCategoryExtensionNumberOfLinesAndAlignmentCallAndPadding =  [CKButtonComponent newWithTitles:{
    {UIControlStateNormal,@"Multi line\nwith text alignemnt\nand padding"}
  }titleColors:{
    {UIControlStateNormal,[UIColor redColor]}
  } images:{
    
  } backgroundImages:{
    
  } titleFont:nil selected:NO enabled:YES action:nil size:{} attributes:{
    {@selector(setBackgroundColor:),[UIColor grayColor]},
    {@selector(xxx_SetNumberOfLines:),@0},
    {@selector(xxx_setTextAlignment:),@(NSTextAlignmentCenter)},
    {@selector(setContentEdgeInsets:),[NSValue valueWithUIEdgeInsets:{10,10,10,10}]}
    
  }accessibilityConfiguration:{
    
  }];
  
  return [CKStackLayoutComponent newWithView:{} size:{} style:{} children:{
    {
      .component = singleLineWithInsets
    },
    {
      .component = multiline
    },
    {
      .component = multilineWithCategoryExtensionNumberOfLinesCall
    },
    {
      .component = multilineWithCategoryExtensionNumberOfLinesAndAlignmentCall
    },
    {
      .component = multilineWithCategoryExtensionNumberOfLinesAndAlignmentCallAndPadding
    }
  }];
}


@end
