var CategoryPopup = {
  setup: function() {
    // add hidden 'div' to end of page to display popup:
    var popupDiv = $('<div id="categoryInfo"></div>');
    popupDiv.hide().appendTo($('body'));
    $(document).on('click', '#category', CategoryPopup.getCategoryInfo);
    // $(document).on('click', '#category', CategoryPopup.toggleCategoryInfo);
    // $("category").click(CategoryPopup.getMovieInfo)
  }

  ,getCategoryInfo: function() {

        var address = "categories/" + $(this).attr('class');
        console.log("address is: "+address);

          $.ajax({type: 'GET',
                  dataType: 'json',
                  url: address,
                  success: CategoryPopup.showCategoryInfo,
                  timeout: 5000,
                  error: function(xhrObj, textStatus, exception) {alert("exception");}
                   // 'timeout' and 'error' functions omitted for brevity
                });
    return(false);

  }
  ,showCategoryInfo: function(jsonData, requestStatus, xhrObject) {

    var categoryName = jsonData.name;

    if( $('#'+categoryName).children().length > 1) {

      $('#'+categoryName+"Quiz").toggle();

    }
    else {

      var quizData = "<div class='well' id="+jsonData.name+"Quiz>"+
        "<table class='table table-condensed'>"+
            '<thead>'+
              '<tr>'+
                '<th>y</th>'+
                '<th>"x"</th>'+
              '</tr>'+
            '</thead>'+
            '<tbody>'+
            '</tbody>'+
          '</table>'+
      "</div>";

      console.log(jsonData);


      $('#'+jsonData.name).append(quizData);


    }



    return(false);  // prevent default link action
  }
  ,hideCategoryInfo: function() {
    $('.quizBox').hide();
    return(false);
  }

  ,toggleCategoryInfo: function() {
    var individualCat = $(this).attr('class');

    if( $('#'+individualCat).children().length > 0) {

      $('#'+individualCat+"Quiz").toggle();

    }
    else {

      CategoryPopup.showCategoryInfo(individualCat);


    }


  }
};
$(CategoryPopup.setup);