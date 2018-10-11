var exec = require('cordova/exec');

exports.saveImage = function(arg0, success, error) {
    exec(success, error, "SaveImage", "coolMethod", [arg0]);
};
