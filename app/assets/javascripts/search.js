$(document).ready(function(){
  $(".key-search").on("keyup", function(){
    var key = $(".key-search").val().trim();
    if (key == "") {
      $(".result-search").html("");
    } else {
      $.get($(this).data("url"), {name: key}, function(data, status){
        $(".result-search").html(data);
      });
    }
  });
});
