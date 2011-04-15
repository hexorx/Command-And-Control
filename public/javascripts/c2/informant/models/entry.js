Informant.EntryModel = Backbone.Model.extend({
  initialize: function(options) {
    this.id = (options._id || options.id);    
    // this.bind('save', Informant.App._locus.fetch());
  },

  locus: function() {
    return this.collection.locus();
  },

  label: function() {
    return this.get(this.locus().escape('entry_label'));
  },
  
  form: function() {
    var that = this;
    var form = that.locus().get('entry_form_builder');
    var fields = _(form.elements).map(function(element) {
      return (element.id == 'entry-fields') ? element : null ;
    });
    
    fields = _(fields).compact()[0];
    fields = _(fields.elements).map(function(element) {
      return _(element.elements).select(function(e) { return e['class'] != 'tip'; })[0];
    });
    _(fields).each(function(field, index, list) {
      if (field.type == 'checkbox') { field.checked = that.get(field.name) }
      else { field.value = that.get(field.name); } 
    });
    form.action = '#';
    return form;
  },
  
  hash_path: function() {
    return this.locus().hash_path() + '/entries/' + this.id;
  }
  
});