Informant.NoticeView = Backbone.View.extend({
    className: "success",
    displayLength: 5000,
    defaultMessage: '',
    
    initialize: function() {
        _.bindAll(this, 'render');
        this.message = this.options.message || this.defaultMessage;
        this.render();
    },
    
    render: function() {
        var view = this;
        
        $(this.el).html(this.message);
        $(this.el).hide();
        $('#notices').html(this.el);
        $(this.el).slideDown();
        $.doTimeout(this.displayLength, function() {
            $(view.el).slideUp();
            $.doTimeout(2000, function() {
                view.remove();
            });
        });
        
        return this;
    }
});

Informant.ErrorView = Informant.NoticeView.extend({
    className: "error",
    defaultMessage: 'Uh oh! Something went wrong. Please try again.'
});