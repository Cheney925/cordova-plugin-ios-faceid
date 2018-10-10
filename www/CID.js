var exec = require('cordova/exec');

var CID = {
	// Check for authentication with biometrics, support both face and touch identification.
	// @reason	the reason why your app wants to use authentication with biometrics
	checkAuth: function(reason, success, error) {
		exec(success, error, 'CID', 'checkAuth', [reason]);
	}
};

module.exports = CID;