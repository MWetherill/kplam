document.addEventListener("turbolinks:load", function() {
  $( document ).ready(function() {
    
    // task list checkbox/strikethrough
    $('.task-check-box-input').each( function() {
      if($(this).is(':checked')) {
        $(this).siblings('.task-check-box-label').css("text-decoration", "line-through")
      };
    });
  
  });
})