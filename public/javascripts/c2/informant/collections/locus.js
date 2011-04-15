Informant.LocusList = Backbone.Collection.extend({
  model: Informant.LocusModel,
  initialize: function() {
    this.url = '/c2/informant/locus';
  }
});