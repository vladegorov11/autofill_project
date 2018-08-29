document.addEventListener('turbolinks:load', function () {
  $( ".link" ).click(function() {
    const tag_id =  this.id
    $.post(
        `${window.location.pathname}/tags/destroy_tag`,
        {tag_id : tag_id},
        function(data) {
           $(`#${tag_id}d`).remove();
        }
    );
  });
});
