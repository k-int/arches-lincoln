define([
    'jquery',
    'underscore',
    'knockout',
    'arches',
    'views/search-base-manager',
    'view-data',
    'search-data'
], function($, _, ko, arches, SearchBaseManagerView, viewData, searchData) {
  
  var grabQueryParams = function () {
    var query = _.chain(decodeURIComponent(location.search).slice(1).split('&'))
    // Split each array item into [key, value]
    // ignore empty string if search is empty
    .map(function(item) {
        if (item) return item.split('=');
    })
    // Remove undefined in the case the search is empty
    .compact()
    // Turn [key, value] arrays into object parameters
    .object()
    // Return the value of the chain operation
    .value();
    
    return query;
  };
  
  ko.subscribable.fn.subscribeChanged = function (callback, context) {
      var savedValue = this.peek();
      return this.subscribe(function (latestValue) {
          var oldValue = savedValue;
          savedValue = latestValue;
          callback.call(context, latestValue, oldValue);
      });
  };

  var previousInit = SearchBaseManagerView.prototype.initialize;
  var LincolnSearchBaseManagerView = SearchBaseManagerView.extend({
    initialize: function() {
      
      // Grab the value before passing off to the original method.
      var queryString = grabQueryParams();
      var selectedFilter = queryString.selected_filter;
      
      // Call the old method in this context with the arguments supplied here.
      previousInit.call(this, arguments);
      
      // This must be done after the original init otherwise it will be reset by that method.
      if (selectedFilter && _.contains(['mapFilter', 'timeFilter', 'savedSearches', 'advancedFilter', 'relatedResourcesManager'], selectedFilter)) {
                
        this.viewModel.selectedTab(this.viewModel[selectedFilter]);
        
      }
    }
  });

  return LincolnSearchBaseManagerView;
});
