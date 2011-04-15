Informant.EntryEditView = Backbone.View.extend({
  el: $('#app-back'),
  
  events: {
    'submit #entry': 'save',
    'click .flip-trigger': 'flip'
  },

  initialize: function() {
    this.render();
  },

  render: function() {
    if(this.model.isNew()) {
      this.$('.content .header h1 .type').html('New');      
      this.$('.content .header h1 strong').html(this.model.locus().get('singular_label'));      
    } else {
      this.$('.content .header h1 .type').html('Editing ' + this.model.locus().get('singular_label'));
      this.$('.content .header h1 strong').html(this.model.label());      
    }

    this.$('#entry').empty().removeClass().buildForm(this.model.form());
        
    this.$('abbr.timeago').timeago();
    $('#app').addClass('flip');
    
    return this;
  },
  
  save: function() {
    var self = this;
    var msg = this.model.isNew() ? 'Entry Successfully Created!' : "Entry Saved!";
    var fields = _(this.$('#entry').serializeArray()).reduce( function(memo, field) {
      memo[field.name] = field.value;
      return memo;
    }, {});

    this.$('#entry-fields input:checkbox').each(function() {
      fields[$(this).attr('name')] = $(this).is(':checked');
    });
    
    this.el.activity();
    
    this.model.save(fields, {
      success: function(model, response) {
        if (_.isEmpty(response.errors)) {
          new Informant.NoticeView({ message: msg });          
          self.clearErrors();
          Informant.App._locus.fetch();
        } else {
          new Informant.ErrorView();
          self.addErrors(response.errors);
        }
        
        self.el.activity(false);
      },
      error: function(model, response) {
        new Informant.ErrorView();
        self.el.activity(false);
      }
    });
    
    return false;
  },
  
  flip: function() { $('#app').toggleClass('flip'); },
  
  addErrors: function(errors) {
    console.log(errors);
    this.clearErrors();
    _(errors).each(function(msg, field) {
      container = $('#entry_' + field + '_field');
      container.addClass('field_with_errors');
      container.find('label').append('<span class="error">' + msg.join(' & ') + '</span>');
    });
  },
  
  clearErrors: function() {
    $('.field_with_errors span.error').remove();
    $('.field_with_errors').removeClass('.field_with_errors');
  }
  
    
});