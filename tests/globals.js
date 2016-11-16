var chromedriver = require('chromedriver');
var path = require('path');
var driverInstanceCI;

function isRunningInCI() {
  if (process.env.ENV == 'CI'){
    return true;
  }
  return false;
}

function startChromeDriver() {
  if (isRunningInCI.call(this)) {
    var location = '/usr/local/bin/chromedriver';
    driverInstanceCI = require('child_process').execFile(location, []);
    return;
  }

  chromedriver.start();
}

function stopChromeDriver() {
  if (isRunningInCI.call(this)) {
    driverInstanceCI && driverInstanceCI.kill();
    return;
  }

  chromedriver.stop();
}

module.exports = {
  before : function(done) {
    startChromeDriver.call(this);
    done();
  },
  after : function(done) {
    stopChromeDriver.call(this);
    done();
  }
};
