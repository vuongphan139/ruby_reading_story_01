$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#form_chapter").on("change", "#avatar-upload", function() {
    $('#img_prev').removeClass('d-none');
    readURL(this);
  });
});
