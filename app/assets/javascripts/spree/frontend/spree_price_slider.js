// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/frontend/all.js'

//= require_tree .

$(function() {
  $(".slider-filter").slider().on({
    slideStop: function() {
      return showLegend($(".slider div.tooltip-inner").text().split(" : "));
    }
  });
  return showLegend($(".slider div.tooltip-inner").text().split(" : "));
});

showLegend = function(values) {
  return $("#price_range_any_legend").text(accounting.formatMoney(values[0], "$", 0, ".", ",") + ' - ' + accounting.formatMoney(values[1], "$", 0, ".", ","));
};
