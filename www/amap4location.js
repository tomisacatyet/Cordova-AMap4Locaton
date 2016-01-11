/*global cordova, module*/
var cordova = require('cordova');
var exec = require('cordova/exec');

module.exports = {
    init: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "AMap4LocationPlugin", "initConfig", []);
    },
    location: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "AMap4Location4Plugin", "location", []);
    },
    stop: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "AMap4Location4Plugin", "stop", []);
    }
};
