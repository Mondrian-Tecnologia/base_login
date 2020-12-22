//= require sb-admin-2/sb-admin-2.js

(function() {
  var proxied = window.XMLHttpRequest.prototype.open;
  window.XMLHttpRequest.prototype.open = function() {
    console.log( arguments );
    return proxied.apply(this, [].slice.call(arguments));
  };
})();