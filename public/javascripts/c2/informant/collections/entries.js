Informant.EntryList = Backbone.Collection.extend({
  model: Informant.EntryModel,
  url: function() {
    return this.parent.url() + '/entries';
  },
  initialize: function(buckets, options) {
    this.parent = options.parent;
  },
  locus: function() {
    return this.parent.locus();
  },
  path: function() {
    return this.parent.entries_path();
  },
  newPath: function() {
    return this.locus().entries_path() + '/new';
  }
});