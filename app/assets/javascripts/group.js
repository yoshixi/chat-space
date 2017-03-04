$(function () {
  var preWord;
  var usersName = [];
  var usersId = [];
  var savedUserId = [];
  var preFunc;

  function appendList(id,name) {
      var item = $('<li class="list" data-id="'+ id +'" data-name="' + name +'">')
      console.log(item);
      item.append('<span>'+ name +'</span>')
      item.append('<a class="addBtn" href="javascript:void(0)" >追加</a>')
      $('ul.searchlists').append(item);
  }

  function saveUsers(id,name) {
    var save = $(`<input type="hidden" name="group[user_ids][]" value="${id}" >`);
    var item = $(`<li class="list" data-id=${id} data-name=${name}>`);
    item.append('<span>'+ name +'</span>');
    item.append('<a class="rmBtn" href="javascript:void(0)" >削除</a>');
    item.append(save);
    $('ul.saveLists').append(item);
  };

  function addEle(data) {
     data.forEach(function (e,i) {
       usersName[i] = e.name
       usersId[i] = e.id
     });
   }

 function ajaxPost(e) {
   $.ajax({
     type: 'get',
     url: '/groups/search',
     data: {word: e},
     dataType: 'json',
     timeout: 500
   })
   .done(function(data){
     for(var i in data){
       if(!savedUserId[data[i].id]){
         appendList(data[i].id,data[i].name);
        }
     }

   });
 }
  $('.user-search').on('keyup', function(){
    var word = $.trim($(this).val());
    $('li').remove('.list');
    if(preWord !== word){
      clearTimeout(preFunc);
      preFunc = ajaxPost(word);
    }
    preWord = word;
  });

  $(document).on('click', '.addBtn', function(){
    var saveName = $(this).parent().attr('data-name');
    var saveId = $(this).parent().attr('data-id');
    $(this).parent('.list').remove();
    savedUserId[saveId] = true;
    console.log(savedUserId);
    saveUsers(saveId, saveName);
  });

  $(document).on('click', '.rmBtn', function(){
    var li  = $(this).parent();
    var rmId = li.attr('data-id')
    console.log(rmId);
    savedUserId[rmId] = false;
    li.remove();
  });

});
