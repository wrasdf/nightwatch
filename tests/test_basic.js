module.exports = {
  'Get URL and title' : function(browser) {
    browser
      .url('http://www.google.com.au')
      .assert.urlContains('google')
      .assert.title('Google');
   }
}
