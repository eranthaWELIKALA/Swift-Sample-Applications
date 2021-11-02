//
//  ViewController.m
//  MoneyBear
//
//  Created by Erantha Welikala on 10/2/20.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    UILabel *statusLabel;
    UILabel *nameLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _fbLoginBtn.center = self.view.center;
    _fbLoginBtn.hidden = true;
//    UIButton *fbLoginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    fbLoginBtn.frame = CGRectMake(50, 50, 100, 100);
//    [fbLoginBtn setTitle:@"Login with Facebook" forState:UIControlStateNormal];
//    [fbLoginBtn addTarget:self action:@selector(loginWithFacebook) forControlEvents:UIControlEventTouchDown];
//    [self.view addSubview:fbLoginBtn];
//    if ([FBSDKAccessToken currentAccessToken]) {
//       // User is logged in, do work such as go to next view controller.
//        statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 30, 500, 100)];
//        statusLabel.text = @"I am logged in";
//        [self.view addSubview:statusLabel];
//    }
//    else {
////        statusLabel.hidden = YES;
//    }
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    // Optional: Place the button in the center of your view.
    loginButton.center = self.view.center;
    loginButton.permissions = @[@"public_profile", @"email"];
    loginButton.delegate = self;
//    
    [self.view addSubview:loginButton];
    
//    [FBSDKProfile loadCurrentProfileWithCompletion: ^(FBSDKProfile *profile, NSError *error){
//       if (profile) {
//           [self currentProfileLoaded:profile];
//       }
//       else {
//
//       }
//     }];
}

-(void) loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    // No errors
    if(!error) {
        if(!result.isCancelled) {
            self->_fbLoginBtn.hidden = true;
            NSLog(@"Declined: %@", result.declinedPermissions);
            if(result.declinedPermissions.count==0) {
                NSDictionary *parameters = @{@"fields":@"id, name, first_name, last_name, email"};
                FBSDKGraphRequest *req = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters HTTPMethod:@"GET"];
                [req startWithCompletionHandler:^(FBSDKGraphRequestConnection * _Nullable connection, id  _Nullable result, NSError * _Nullable error) {
                    if(!error) {
                        double middle = self.view.center.x;
                        double center = self.view.center.y;
                        UILabel *fNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(middle-100, center-150, 500, 50)];
                        UILabel *lNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(middle-100, center-100, 500, 50)];
                        UILabel *emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(middle-100, center-50, 500, 50)];
                        UILabel *userIdLabel = [[UILabel alloc] initWithFrame:CGRectMake(middle-100, center, 500, 50)];
                        
                        fNameLabel.text = result[@"first_name"];
                        lNameLabel.text = result[@"last_name"];
                        emailLabel.text = result[@"email"];
                        userIdLabel.text = result[@"id"];
                        
                        [self.view addSubview:fNameLabel];
                        [self.view addSubview:lNameLabel];
                        [self.view addSubview:emailLabel];
                        [self.view addSubview:userIdLabel];
                    } else {
                        NSLog(@"error \(error)");
                    }
                }];
                [self loadFBProfilePicture];
            }
        }
    }

}

-(void) loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] removeCookiesSinceDate: [NSDate dateWithTimeIntervalSince1970:(0)]];
}

//-(void)loginWithFacebook {
//    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
//    [loginManager logInWithPermissions:@[@"email", @"public_profile"]
//                        fromViewController:self
//                                   handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
//        NSLog(@"%@", result);
//     }];
////    [loginManager logInWithPublishPermissions:permissions
////fromViewController: self handler: nil];
//}

//-(void) currentProfileLoaded:(FBSDKProfile*) profile{
//    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 500, 100)];
//    nameLabel.text = [NSString stringWithFormat:@"%@ %@", profile.firstName, profile.lastName];
//    nameLabel.hidden = NO;
//    [self.view addSubview:nameLabel];
//}

-(void) viewWillAppear:(BOOL)animated {
//    if ([FBSDKAccessToken currentAccessToken]) {
//       // User is logged in, do work such as go to next view controller.
//        statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 30, 500, 100)];
//        statusLabel.text = @"I am logged in";
//        statusLabel.hidden = NO;
//        [self.view addSubview:statusLabel];
//    }
//    else {
//        statusLabel.hidden = YES;
//    }
//
//    [FBSDKProfile loadCurrentProfileWithCompletion: ^(FBSDKProfile *profile, NSError *error){
//       if (profile) {
//           [self currentProfileLoaded:profile];
//       }
//       else {
//
//           self->nameLabel.hidden = YES;
//       }
//     }];
}

- (IBAction)login:(id)sender {
    NSLog(@"======ViewController===login==");
//    [self fbLogin];
}

-(void)fbLogin {
    NSLog(@"======ViewController===fbLogin==");
    FBSDKLoginManager *fbLoginManager = [[FBSDKLoginManager alloc] init];
    [fbLoginManager logOut];
    NSArray *permissionArr = @[@"email", @"public_profile"];
    [fbLoginManager logInWithPermissions:permissionArr fromViewController:self handler:^(FBSDKLoginManagerLoginResult * _Nullable result, NSError * _Nullable error) {
        // No errors
        if(!error) {
            if(!result.isCancelled) {
                self->_fbLoginBtn.hidden = true;
                NSLog(@"Declined: %@", result.declinedPermissions);
                if(result.declinedPermissions.count==0) {
                    NSDictionary *parameters = @{@"fields":@"id, name, first_name, last_name, email"};
                    FBSDKGraphRequest *req = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters HTTPMethod:@"GET"];
                    [req startWithCompletionHandler:^(FBSDKGraphRequestConnection * _Nullable connection, id  _Nullable result, NSError * _Nullable error) {
                        if(!error) {
                            double middle = self.view.center.x;
                            double center = self.view.center.y;
                            UILabel *fNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(middle-100, center-150, 500, 50)];
                            UILabel *lNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(middle-100, center-100, 500, 50)];
                            UILabel *emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(middle-100, center-50, 500, 50)];
                            UILabel *userIdLabel = [[UILabel alloc] initWithFrame:CGRectMake(middle-100, center, 500, 50)];

                            fNameLabel.text = result[@"first_name"];
                            lNameLabel.text = result[@"last_name"];
                            emailLabel.text = result[@"email"];
                            userIdLabel.text = result[@"id"];

                            [self.view addSubview:fNameLabel];
                            [self.view addSubview:lNameLabel];
                            [self.view addSubview:emailLabel];
                            [self.view addSubview:userIdLabel];
                        } else {
                            NSLog(@"error \(error)");
                        }
                    }];
                    [self loadFBProfilePicture];
                }
            }
        }
    }];
}

-(void) loadFBProfilePicture {
    NSLog(@"======ViewController===loadFBProfilePicture==");
    // Retrieving the Facebook Profile PIcture
    FBSDKProfilePictureView *profilePictureView = [[FBSDKProfilePictureView alloc] init];
    profilePictureView.frame = CGRectMake(0,0,100,100);
    profilePictureView.center = CGPointMake(self.view.center.x-0, self.view.center.y-200);
    profilePictureView.profileID = [[FBSDKAccessToken currentAccessToken] userID];
    
    [self.view addSubview:profilePictureView];
}


@end
