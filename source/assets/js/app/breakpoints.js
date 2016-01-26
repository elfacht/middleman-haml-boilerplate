/**
 * Import breakpoints from CSS
 *
 * Source: https://www.lullabot.com/blog/article/importing-css-breakpoints-javascript
 */

var Breakpoint = {};

Breakpoint.refreshValue = function () {
  this.value = window.getComputedStyle(document.querySelector('body'), ':before')
                      .getPropertyValue('content').replace(/['"]+/g, '');
};