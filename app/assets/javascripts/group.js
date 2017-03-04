$(function () {
  var preWord;
  var usersName = [];
  var usersId = [];
  var savedUserId = [];

  function appendList(id,name) {
      var item = $('<li class="list" data-id="'+ id +'" data-name="' + name +'">')
      console.log(item);
      item.append('<span>'+ name +'</span>')
      item.append('<a class="addBtn" href="javascript:void(0)" >追加</a>')
      $('ul.searchlists').append(item);
  }

  function editElement(e) {
    var re = "^" + e
    return re
  }

  function addEle(data) {
    var i = 1;
    data.forEach(function (e) {
      usersName.push(e.name);
      usersId.push(e.id);
      i ++;
    });
    savedUserId = Array.apply(null, Array(i)).map(function () {return 0 });
    console.log(usersId);
  }

  function saveUsers(id,name) {
    var save = $(`<input type="hidden" name="group[user_ids][]" value="${id}" >`);
    var item = $(`<li class="list" data-id=${id} data-name=${name}>`);
    item.append('<span>'+ name +'</span>');
    item.append('<a class="rmBtn" href="javascript:void(0)" >削除</a>');
    item.append(save);
    $('ul.saveLists').append(item);
  };

  $.ajax({
    type: 'get',
    url: '/groups/search',
    dataType: 'json',
    timeout: 10000
  })
  .done(function(data){
    addEle(data);
  })

  $('.user-search').on('keyup', function(){
    var input = $(this).val();
    var inputs = input.split(" ").filter(function (e) {return e;});
    var inputsNew = inputs.map(editElement)
    var word = inputsNew.join("|");
    var reg = new RegExp(inputsNew.join("|"));
    $('li').remove('.list')
    if (word != preWord && input.length !== 0) {
    usersName.forEach(function (e,i,ar) {
        if(e.match(reg) && savedUserId[i] === 0) {
          appendList(i+1,e );
        }
    });//each
  }
    preWord = word;
  });

  $(document).on('click', '.addBtn', function(){
    var saveName = $(this).parent().attr('data-name');
    var saveId = $(this).parent().attr('data-id');
    if(savedUserId.indexOf(saveId) >= 0){

    }else {
      saveUsers(saveId, saveName);
    }
  });

  $(document).on('click', '.rmBtn', function(){
    var li  = $(this).parent();
    li.remove();
  });

});
