$( document ).on('turbolinks:load',function() {
  $('#term').autocomplete({
    source: "/contacts/autocomplete",
    minLength: 3,
    select: function(event, ui) {
      $('#term').val(ui.item.value);
      $(this).closest('form').submit();
    }
  });

  $("#add-new-group").hide();
  $('#add-group-btn').click(function() {
    $("#add-new-group").slideToggle(function() {
      $('#new_group').focus();
    });
    return false;
  });

  $('#save-group-btn').click(function(event) {
    event.preventDefault();

    let newGroup = $("#new_group");
    let inputGroup = newGroup.closest('.input-group');

    $.ajax({
      url: "/groups",
      method: "post",
      data: {
        group: { name: $('#new_group').val() }
      },
      success: function(group) {
        if (group.id != null) {
          inputGroup.removeClass('has-error')
          inputGroup.next('.text-danger').remove();

          let newOption = $('<option />').attr('value',group.id).attr('selected',true).text(group.name);
          $('#contact_group_id').append(newOption);

          newGroup.val("");
        }
      },
      error: function(xhr) {
        console.log(xhr);
        const errors = xhr.responseJSON;
        const error = errors.join(", ");
        if (error) {
          inputGroup.next('.text-danger').detach();

          inputGroup
            .addClass('has-error')
            .after('<p class="text-danger">'+ error + '</p>');
        }
      }
    });
  });

  toastr.options = {
    "closeButton": false,
    "debug": false,
    "newestOnTop": false,
    "progressBar": false,
    "positionClass": "toast-top-right",
    "preventDuplicates": false,
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "5000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  };

});
