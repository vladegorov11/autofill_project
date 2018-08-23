

document.addEventListener('turbolinks:load', function () {
  $( ".link" ).click(function() {
    $(`#${this.id}d`).remove();
  });
});
