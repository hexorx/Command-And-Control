Informant.AppController = Backbone.Controller.extend({
  routes: {
    "/": "root",
    "/locus/:locusId/entries": "entryIndex",
    "/locus/:locusId/entries/new": "entryNew",
    "/locus/:locusId/entries/:entryId/edit": "entryEdit",
    "/locus/:locusId/buckets/:bucketId/entries": "entryIndex"
  },
  
  initialize: function(options) {
    this._current_nav_link = window.location.hash;
    this._locus = new Informant.LocusList();
    this._sidebar = new Informant.SidebarView({ collection: this._locus });
    this._entryIndex = new Informant.EntryIndexView();
    this._locus.fetch();
  },
  
  root: function() {
  },

  entryIndex: function(locusId,bucketId) {
    var locus = this._locus.get(locusId);
    if ( bucketId ) {
      var bucket = locus.buckets.get(bucketId);
    }    
    var entries = (bucket || locus).entries

    this._current_nav_link = entries.path();
    this._entryIndex.render(entries);
  },
  
  entryNew: function(locusId) {
    var locus = this._locus.get(locusId);
    var entry = locus.entries.add().last();
    new Informant.EntryEditView({ model: entry });
  },
  
  entryEdit: function(locusId,entryId) {
    var locus = this._locus.get(locusId);
    var entry = locus.entries.get(entryId);
    new Informant.EntryEditView({ model: entry });
  }
    
});