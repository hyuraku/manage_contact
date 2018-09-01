$(function(){
  $('#term').autocomplete({
    source: "/contacts/autocomplete",
    minLength: 3,
    select: function(event, ui) {
      $('#term').val(ui.item.value);
    }
  });
});
