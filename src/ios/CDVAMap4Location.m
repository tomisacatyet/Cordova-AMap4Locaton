//
//  CDVAMapLocation.m
//  HybirdDemo
//
//  Created by MacBookPro on 16/1/8.
//
//

#import "CDVAMap4Location.h"

@implementation CDVAMap4Location

-(void) initConfig{
    //高德APIKey
    [AMapLocationServices sharedServices].apiKey = @"4b2050d5cdfc48ff81e625caae0b453f";
    if(!self.locationManager){
        self.locationManager = [[AMapLocationManager alloc]init];
    }
    if(![self.locationManager desiredAccuracy]){
        //带逆地理信息的一次定位
        [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    }
}


// errorInfo 错误信息 errorCode 错误编码 
-(void) location:(CDVInvokedUrlCommand*)command{
    //初始化配置
    [self initConfig];
    
    //执行一次定位
    [self.commandDelegate runInBackground:^{
        // 带逆地理（返回坐标和地址信息）
        [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
            
            CDVPluginResult* pluginResult = nil;
            
            if (error)
            {
                NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
                
                if (error.code == AMapLocationErrorLocateFailed)
                {
                NSString *errorCode = [NSString stringWithFormat: @"%ld", (long)error.code];
                NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                      errorCode,@"errorCode",
                                      error.localizedDescription,@"errorInfo",
                                      nil];
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:dict];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            }else{
                NSLog(@"location:%@", location);
                
                if (regeocode)
                {
                    NSLog(@"reGeocode:%@", regeocode);
                    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:regeocode.province,@"provinceName",
                                          regeocode.city,@"cityName",
                                          regeocode.citycode,@"cityCode",
                                          regeocode.district,@"districtName",
                                          regeocode.township,@"roadName",
                                          nil];
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dict];
                    //返回结果
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }
            }
            
        }];
    }];
}


@end
