Informant.LocusModel = Backbone.Model.extend({
  initialize: function(options) {
    this.id = options._id;
    this.buckets = new Informant.BucketList(options.buckets, { parent: this });
    this.entries = new Informant.EntryList(options.entries_page, { parent: this, cached: false });
  },

  locus: function() {
    return this;
  },
  
  index_label: function() { return 'All'; },
  
  entries_path: function() {
    return this.hash_path() + '/entries';
  },
  
  hash_path: function() {
    return '#/locus/' + this.locus().id;
  }
  
});