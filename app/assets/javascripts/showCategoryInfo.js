var CategoryPopup = {
  setup: function() {

    $(document).on('click', '#category', CategoryPopup.getCategoryInfo);
    $(document).on('click', '#quizSelection', CategoryPopup.goToQuiz);
  }

  ,getCategoryInfo: function() {

        var category = $(this).attr('class');
        var address = "categories/" + category;

          $.ajax({type: 'GET',
                  dataType: 'json',
                  url: address,
                  success: function(jsonData){
                      CategoryPopup.showCategoryInfo(jsonData,category)
                  },
                  timeout: 5000,
                  error: function(xhrObj, textStatus, exception) {alert("exception");}
                   // 'timeout' and 'error' functions omitted for brevity
                });
    return(false);

  }
  ,showCategoryInfo: function(jsonData, categoryName) {



    if( $('#'+categoryName).children().length > 1) {

      $('#'+categoryName+"Quiz").toggle();

    }
    else {

      var quizData = "<div class='well' id="+categoryName+"Quiz>"+
        "<table class='table table-condensed' id="+categoryName+"Table>"+
            '<thead>'+
              '<tr>'+
                '<th>Quiz Number</th>'+
                '<th>Created</th>'+
              '</tr>'+
            '</thead>'+
            '<tbody>'+
            '</tbody>'+
          '</table>'+
      "</div>";

      $('#'+categoryName).append(quizData);



       for(var i=0;i<jsonData.length;i++){
          var quizNumber = i+1;
           $("#"+categoryName+ "Table tbody").append(
               "<tr>"+
                   "<td id='quizSelection' class="+categoryName+">"+jsonData[i].id+"</td>"+
                   "<td>"+jsonData[i].created_at+"</td>"+
               "</tr>");
       }

    }

    return(false);  // prevent default link action
  }


  ,goToQuiz: function() {

    var quizCat = $(this).attr('class');
    var quizId = $(this).html();

    var nextLocation = "/categories/"+quizCat+"/quizzes/"+quizId;

    window.location = nextLocation;

  }



};
$(CategoryPopup.setup);