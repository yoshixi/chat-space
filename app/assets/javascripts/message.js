$(function() {

  function buildHtml(message) {
    var addHtml = '<p class="chatName">'        + message.name       +
                  '<span class="time">'         + message.created_at + '</span></p>' +
                  '<p class="message">'         + message.text       + '</p>'        ;

    if (message.image.url) {
        addHtml += '<p class="image"><img src="' + message.image.url  +'"></p>';
    };
    var html = $('<li class="message">').append(addHtml);
    return html;
  }

  function addHtml(e) {
    var html =  buildHtml(e)
    $('.messages').append(html);
  }

  function errorHtml(msg) {
    var addHtml = '<div class="header alert"><p class="header__txt">' + msg + '</p></div>'
    return addHtml
  }

  $('form.js-form').on('submit', function(e) {
    e.preventDefault();
    var $form = $(this);
    var fd = new FormData($form[0]);
    var textField = $('.js-form__text-field');
    var message = textField.val();
    $('.header.alert').remove();
    $.ajax({
      type: 'post',
      url: './messages',
      data: fd,
      dataType: 'json',
      timeout: 10000,
      processData: false,
      contentType: false
    })
    .done(function(data){
      if(data.error){
        data.error.forEach(function(e){
          var msg =  e.message
          var html = errorHtml(msg)
          $('header').append(html);
        })
      }else{
        addHtml(data)
      }
      $form[0].reset();
    })
    .fail(function(){
        alert('error');
     });
    return false;
  });



  function loadPage() {
    $.ajax({
      type: 'get',
      url: './messages',
      dataType: 'json',
    })
    .done(function (data) {
      for(var e in data){
        addHtml(e)
        };
    })
  }

  setInterval(loadPage, 5000);

});
