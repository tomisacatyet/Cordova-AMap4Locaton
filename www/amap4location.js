/*global cordova, module*/
var cordova = require('cordova');
var exec = require('cordova/exec');

module.exports = {
    location: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "AMap4LocationPlugin", "location", []);
    },
    stop: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "AMap4LocationPlugin", "stop", []);
    }
};
