Informant.SidebarView = Backbone.View.extend({
  el: $('#sidebar'),
  initialize: function(options) {
    _.bindAll(this, 'render');
    this.collection.bind('refresh', this.render);
    
    this.el.activity();
  },

  render: function() {
    this.el.activity();
    this.el.empty();
    this.el.html(Informant.JST.sidebar({collection: this.collection}));

    this.$('.current').removeClass('current');
    this.$('a[href="' + Informant.App._current_nav_link + '"]').parent().addClass('current');
    
    this.el.activity(false);
    
    $('.sitemap a').bind('click', function() {
      $('.sitemap .current').removeClass('current');
      $(this).parent().addClass('current');
    });  
    
    return this;
  }
});