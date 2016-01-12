//
//  CDVAMapLocation.h
//  Created by tomisacat on 16/1/8.
//
//

#import <Cordova/CDVPlugin.h>
#import <AMapLocationKit/AMapLocationKit.h>

@interface CDVAMap4Location : CDVPlugin

@property (nonatomic, strong) AMapLocationManager *locationManager;

-(void) initConfig;

-(void) location:(CDVInvokedUrlCommand*)command;

@end
