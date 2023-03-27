/**
 * 
 */
 
$(function() {
  $('#managernm').change(function() {
    if($(this).val() == '직접입력') {
      $('#managernm_input').show();
    } else {
      $('#managernm_input').hide();
    }
  });
});





