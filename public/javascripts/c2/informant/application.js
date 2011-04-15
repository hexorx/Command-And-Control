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

var Locus = {
  label: 'Users',
  path: 'users',
  scopes: 'ScopeList',
  attributes: 'AttributeList'
};

var Attribute = {
  label: 'fu',
  template: 'string'
};

var Scope = {
  label: 'Active',
  path: 'active',
  entries: 'EntryList'
};

var Entry = {
  fu: 'bar',
};