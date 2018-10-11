var exec = require('cordova/exec');

exports.saveImage = function(url, success, error) {
    exec(success, error, "SaveImage", "saveToAlbum", [url]);
};
