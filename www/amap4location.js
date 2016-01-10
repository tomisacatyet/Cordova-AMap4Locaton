/*global cordova, module*/
var cordova = require('cordova');
var exec = require('cordova/exec');

module.exports = {
    init: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "AMapLocation4Plugin", "initConfig", []);
    },
    location: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "AMapLocation4Plugin", "location", []);
    },
    stop: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "AMapLocation4Plugin", "stop", []);
    }
};
