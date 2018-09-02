$(function() {
  // $('#add-new-group').css("display" , "none");
  // console.log('fk')
  // $('#add-group-btn').click(function() {
  //   $('#add-new-group').slideToggle(function() {
  //     $('#new_group').focus();
  //   });
  //   return false;
  // });

  $('#save-group-btn').click(function(event) {
    event.preventDefault();

    $.ajax({
      url: "/groups",
      method: "post",
      data: {
        group: { name: $('#new_group').val() }
      },
      success: function(response) {
        console.log(response);
      },
      error: function(xhr) {
        console.log(xhr);
        const errors = xhr.responseJSON;
        const error = errors.join(", ");
        if (error) {
          $("#new_group")
            .closest('.input-group')
            .addClass('has-error')
            .after('<p class="text-danger">'+ error + '</p>');
        }
      }
    });
  });
});
