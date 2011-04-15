Informant.BucketList = Backbone.Collection.extend({
  model: Informant.BucketModel,
  url: function() {
    return this.parent.url() + '/buckets';
  },
  initialize: function(buckets, options) {
    this.parent = options.parent;
  },
});