// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require highcharts
//= require chartkick
//= require_tree .

document.addEventListener('turbolinks:load', function () {
  $( "#project_project_type" ).change(function() {
    if ($( "#project_project_type" ).val() === 'web'){
      $('#domain').append('<input class="string optional form-control mt-4 mb-4" placeholder="Domain" type="text" name="project[domain]" id="project_domain">');
    }else {
      $('#domain').html('');
    }
  });
});
