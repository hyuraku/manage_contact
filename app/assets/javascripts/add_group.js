$( document ).on('turbolinks:load',function() {

  // $('.pagination a[data-remote="true"]').click(function () {
  //   console.log("hwe");
  //   history.pushState(null, null, $(this).attr('href'));
  //   console.log("after");
  // })
  $('#form-modal-save-btn').click(function(){
    $('#new_contact').submit();
  });

  $('body').on('click','.pagination a[data-remote=true]',function () {
    console.log("hello");
    history.pushState(null,null,$(this).attr('href'));
  });


  $('#term').autocomplete({
    source: "/contacts/autocomplete",
    minLength: 2,
    select: function(event, ui) {
      $('#term').val(ui.item.value);
      $(this).closest('form').submit();
    }
  });

  $("#add-new-group").hide();
  $('body').on('click','#add-new-group',function() {
    $("#add-new-group").slideToggle(function() {
      $('#new_group').focus();
    });
    return false;
  });

  $('body').on('click','#save-group-btn',function(event) {
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
});
