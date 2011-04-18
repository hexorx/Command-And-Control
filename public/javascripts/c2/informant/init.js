var lib_dir = '/javascripts/c2/lib/';
var app_dir = '/javascripts/c2/informant/';

Sexy
.js(lib_dir + 'jquery.min.js')
.js(lib_dir + 'underscore.min.js')
.js(lib_dir + 'backbone-min.js')
.js(lib_dir + 'jquery.ba-dotimeout.min.js')
.js(lib_dir + 'jquery.timeago.js')
.js(lib_dir + 'jquery.activity-indicator-1.0.0.min.js')
.js(lib_dir + 'jquery.dform-0.1.2.min.js')
.js(app_dir + 'application.js')
.js(app_dir + 'views/notice.js')
.js(app_dir + 'views/sidebar.js')
.js(app_dir + 'views/entries/index.js')
.js(app_dir + 'views/entries/edit.js')
.js(app_dir + 'controllers/app.js')
.js(app_dir + 'models/locus.js')
.js(app_dir + 'models/bucket.js')
.js(app_dir + 'models/entry.js')
.js(app_dir + 'collections/locus.js')
.js(app_dir + 'collections/buckets.js')
.js(app_dir + 'collections/entries.js', function() {
  $(function() {
    // CSRF Load
    $(document).ajaxSend(function(e, xhr, options) {
      var token = $("meta[name='csrf-token']").attr("content");
      xhr.setRequestHeader("X-CSRF-Token", token);
    });
    
    window.location.hash = '/';

    // Get a Backbone
    Informant.init();

    $('.flip-trigger').bind('click', function() {
      $('#app').toggleClass('flip');
    });
    
    // Triggers
    $('.dropdown-trigger').bind('click', function() {
      $(this).parent().toggleClass('active');
    });
  });
});



