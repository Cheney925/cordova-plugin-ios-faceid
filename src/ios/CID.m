#import "CID.h"
#import <LocalAuthentication/LocalAuthentication.h>

@implementation CID

@synthesize callbackID, pluginResult;

- (void) checkAuth:(CDVInvokedUrlCommand*)command
{
    self.callbackID = command.callbackId;
    pluginResult = nil;

    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = [command.arguments objectAtIndex:0];
    
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:myLocalizedReasonString reply:^(BOOL success, NSError *error) {
            if (success) {
                // User authenticated successfully, take appropriate action
                NSLog(@"success");
                [self returnResult:@"success"];
            } else {
                // User did not authenticate successfully, look at error and take appropriate action
                if (error.code == kLAErrorUserFallback) {
                    NSLog(@"use password instead");
                    [self returnResult:@"User use password instead"];
                } else if (error.code == kLAErrorUserCancel) {
                    NSLog(@"cancelled");
                    [self returnResult:@"User cancelled"];
                } else {
                    NSLog(@"failed");
                    [self returnResult:@"failed"];
                }
            }
        }];
    } else {
        // Could not evaluate policy; look at authError and present an appropriate message to user
        NSLog(@"Current device doesn't support authentication with biometrics");
        [self returnResult:@"Current device doesn't support authentication with biometrics"];
    }
}

- (void)returnResult:(NSString *)result
{
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackID];
}

@end
