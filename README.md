#高德Cordova 定位 插件

##Android

###Android API：
http://lbs.amap.com/api/android-location-sdk/locationsummary/
###Android配置项：
<meta-data
  android:name="com.amap.api.v2.apikey"
  android:value="申请的appKey" />

##iOS

###iOS API:
http://lbs.amap.com/api/ios-location-sdk/summary/
###iOS配置项(待完善):

###调用示例：
```javascript
if(window.amap4location){
  window.amap4location.location(function (response) {
    /**
     * {
     * provinceName:'',
     * cityName:'',
     * cityCode:'',
     * districtName:'',
     * roadName:''
     * }
     */
    alert("当前的位置:" +
        "  省份-"+response['provinceName']
        +" 市-"+response['cityName']
        +" 区-"+response['districtName']
        +" 街-"+response['roadName']);
  }, function (error) {
  alert(error);
    /**
     * {
     *  errorInfo:'',
     *  errorCode:''
     * }
     */
     alert("异常信息:"
         + " 错误编码:"+error['errorCode']
         + " 错误信息"+error['errorInfo']);
  });
