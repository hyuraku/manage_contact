$(function(){
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

});
