var Informant = {
  init: function() {
    Informant.loadTemplates();
    Informant.App = new Informant.AppController();
    Backbone.history.start();
  },
  JST: {},
  loadTemplates: function() {
    $('[type="text/js-template"]').each(function() {
      Informant.JST[$(this).data('template')] = _.template($(this).html());
    });
  }
};
