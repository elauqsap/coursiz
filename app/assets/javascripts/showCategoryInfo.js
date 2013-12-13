var CategoryPopup = {
  setup: function() {
    $(document).on('click', '.category', CategoryPopup.getCategoryInfo);
    $(document).on('click', '#quizSelection', CategoryPopup.goToQuiz);

  }

  ,getCategoryInfo: function() {

        // var address = $(this).attr('href');
        //  // var address = "categories/" + category;
        //  var parent = $(this).parent();
        //  var category = $(parent).attr('id');

        var category = $(this).attr('id');
        category = category.replace(/ /g,'');
        category = category.toLowerCase();

        var address = "categories/"+category;

          $.ajax({type: 'GET',
                  dataType: 'json',
                  url: address,
                  success: function(jsonData){
                      CategoryPopup.showCategoryInfo(jsonData,category)
                  },
                  timeout: 5000,
                  error: function(xhrObj, textStatus, exception) {}
                   
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

              var structure = null;
              if(difficulty == 1){
                structure = "Beginning"
              }
              else if(difficulty == 2){
                structure = "Middle"
              }
              else if(difficulty == 3){
                structure = "End"
              }

              dataArray.push(difficulty);
              $("#"+categoryName+ "Table tbody").append(
                  "<tr>"+
                      "<td id='quizSelection' class="+categoryName+">"+structure+"</td>"+
                  "</tr>");

          }


       }

    }

    return(false);  // prevent default link action
  }


  ,goToQuiz: function() {

    var quizCat = $(this).attr('class');
    var quizId = $(this).html();
    var url = null;

    if(quizId == "Beginning"){
      url = 1;
    }
    else if(quizId == "Middle"){
      url = 2;
    }
    else if(quizId == "End"){
      url = 3;
    }



    var nextLocation = "/categories/"+quizCat+"/quizzes/"+url;

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