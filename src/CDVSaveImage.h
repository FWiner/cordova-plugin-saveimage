#import <Cordova/CDVPlugin.h>

@interface CDVSaveImage : CDVPlugin

- (void)saveToAlbum:(CDVInvokedUrlCommand*)command;

@end