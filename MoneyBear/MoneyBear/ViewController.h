//
//  ViewController.h
//  MoneyBear
//
//  Created by Erantha Welikala on 10/2/20.
//

#import <UIKit/UIKit.h>

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKLoginKit/FBSDKLoginManager.h>
#import <FBSDKCoreKit/FBSDKProfile.h>

@interface ViewController : UIViewController<FBSDKLoginButtonDelegate, FBSDKGraphRequestConnectionDelegate>

@property (weak, nonatomic) IBOutlet UIButton *fbLoginBtn;

@end

