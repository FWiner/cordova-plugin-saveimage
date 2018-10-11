#import "CDVSaveImage.h"
#import <Cordova/CDVPlugin.h>


@implementation CDVSaveImage

- (void)saveToAlbum:(CDVInvokedUrlCommand*)command {
    NSArray<NSString *> *url = [command.arguments objectAtIndex:0];
    UIImage *originImage = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
    self saveImageToPhotos:originImage];
}


- (void)saveImageToPhotos:(UIImage*)savedImage
{
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL); 
}

- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{  
    CDVPluginResult* pluginResult = nil;
    NSString *msg = nil ;  
    if(error != NULL){
        msg = @"error" ;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }else{
        msg = @"success" ;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:msg];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end