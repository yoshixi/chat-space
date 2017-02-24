$(function() {
  function buildHTML(message) {
    var addHtml = '<p class="chatName">' + message. name +
                  '<span class="time">'  + message.time  + '</span></p>' +
                  '<p class="message">'  + message.text  + '</p>';

    var html = $('<li class="message">').append(addHtml);
    return html;
  }

  $('form.js-form').on('submit', function(e) {
    e.preventDefault();
    var $form = $(this);
    var textField = $('.js-form__text-field');
    var message = textField.val();
    $.ajax({
      type: 'post',
      url: './messages',
      data: $form.serialize() ,
      dataType: 'json',
      timeout: 10000
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html);
      $form[0].reset();
    })
    .fail(function(){
      alert('error');
    });
    return false;
  });
});
