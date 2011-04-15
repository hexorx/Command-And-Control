Informant.BucketModel = Backbone.Model.extend({
  initialize: function(options) {
    this.id = options._id;
    this.entries = new Informant.EntryList(options.entries_page, { parent: this, cached: false });
  },

  locus: function() {
    return this.collection.parent;
  },

  entries_path: function() {
    return '#/locus/' + this.locus().id + '/buckets/' + this.id + '/entries';
  },
  
  index_label: function() { return this.escape('label'); }
});