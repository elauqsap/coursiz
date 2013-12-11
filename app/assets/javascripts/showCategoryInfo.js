var CategoryPopup = {
  setup: function() {
    $(document).on('click', '#category', CategoryPopup.getCategoryInfo);
    $(document).on('click', '#quizSelection', CategoryPopup.goToQuiz);

    var expandAll = '<div class="btn-group">'+
                      '<button class="btn">Expand All</button>'
                    "</div>";

    // $('.expandDiv').html(expandAll);

    $(document).on('click', '.expandDiv', CategoryPopup.expandAllCategories);


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
                  error: function(xhrObj, textStatus, exception) {}
                   // 'timeout' and 'error' functions omitted for brevity
                });
    return(false);

  }
  ,showCategoryInfo: function(jsonData, categoryName) {



    if( $('#'+categoryName).children().length > 1) {

      $('#'+categoryName+"Quiz").toggle();

    }
    else {

      var quizData = "<div class='well animated fadeInDown' id="+categoryName+"Quiz>"+
        "<table class='table table-bordered' id="+categoryName+"Table>"+
            '<thead>'+
              '<tr>'+
                '<th>Quiz Difficulty</th>'+
              '</tr>'+
            '</thead>'+
            '<tbody>'+
            '</tbody>'+
          '</table>'+
      "</div>";

      $('#'+categoryName).append(quizData);

        var dataArray = new Array();


       for(var i=0;i<jsonData.length;i++){
          if($.inArray(jsonData[i].difficulty, dataArray) == -1){
              var difficulty = jsonData[i].difficulty;

              dataArray.push(difficulty);
              $("#"+categoryName+ "Table tbody").append(
                  "<tr>"+
                      "<td id='quizSelection' class="+categoryName+">"+jsonData[i].difficulty+"</td>"+
                  "</tr>");

          }


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


  ,expandAllCategories: function() {

    $('#category').each(function() {

      console.log($(this));

      this.trigger("click");


    });



  }



};
$(CategoryPopup.setup);