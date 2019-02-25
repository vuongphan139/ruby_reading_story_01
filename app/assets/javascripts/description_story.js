$(function() {
  if ($('.description-content').outerHeight() >= 190) {
    $('.btn-more').removeClass('none');
    $('.description-content').css('max-height', '170px');
  }

  $('.see_more').click(function (event) {
    var _this = $(this);

    if (_this.hasClass('see_more')) {
      $(".description-content").css({maxHeight: '', overflow: ''});
      _this.html("<< " + I18n.t("stories.show.view_less"));
    }
    else {
      $(".description-content").css({maxHeight: '170px', overflow: 'hidden'});
      _this.html(">> " + I18n.t("stories.show.view_more"));
    }

    _this.toggleClass('see_more see_less');
    return false;
  });
});
