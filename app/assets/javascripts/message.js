$(function() {

  function buildHTML(message) {
    var addHtml = '<p class="chatName">' + message.name  +
                  '<span class="time">'  + message.created_at  + '</span></p>' +
                  '<p class="message">'  + message.text  + '</p>';

    var html = $('<li class="message">').append(addHtml);
    return html;
  }

  function errorHtml(msg) {
    var addHtml = '<div class="header alert"><p class="header__txt">' + msg + '</p></div>'
    return addHtml
  }

  $('form.js-form').on('submit', function(e) {
    e.preventDefault();
    var $form = $(this);
    var textField = $('.js-form__text-field');
    var message = textField.val();
    $('.header.alert').remove();
    $.ajax({
      type: 'post',
      url: './messages',
      data: $form.serialize() ,
      dataType: 'json',
      timeout: 10000
    })
    .done(function(data){
      if(data.error){
        data.error.forEach(function(e){
          var msg =  e.message
          var html = errorHtml(msg)
          $('header').append(html);
        })
      }else{
        var html = buildHTML(data);
        $('.messages').append(html);
      }
      $form[0].reset();
    })
    .fail(function(){
        alert('error');
     });
    return false;
  });
});
