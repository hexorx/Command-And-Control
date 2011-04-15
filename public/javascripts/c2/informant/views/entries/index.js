Informant.EntryIndexView = Backbone.View.extend({
  el: $('#app-front'),

  initialize: function(options) {
  },

  render: function(entries) {
    var that = this;
    that.el.empty();
    that.el.html(Informant.JST.entryIndex({entries: entries}));
    $('#aside').html(Informant.JST.entryIndexAside({entries: entries}));
    
    $('.flip-trigger').bind('click', function() {
      $('#app').toggleClass('flip');
    });
    
    $('abbr.timeago').timeago();
   
    $('#app').removeClass('flip');

    return this;
  }
});