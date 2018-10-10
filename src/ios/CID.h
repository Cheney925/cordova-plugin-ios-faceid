#import <Cordova/CDV.h>

@interface CID : CDVPlugin

@property NSString *callbackID;
@property CDVPluginResult *pluginResult;

- (void)checkAuth:(CDVInvokedUrlCommand*)command;

@end
