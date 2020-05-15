// タブのidを自動でつけている
$(function(){
    $('ul li').each(function(i){
        $(this).attr('id','number' + (i+1));
    });
});

// number1にselectedクラスをつけている
$(function(){
    $('#number1').addClass("selected");
    });

// 各コンテンツの番号をプロジェクトと揃えている
$(function(){
    $('.contents .one-pj').each(function(i){
        $(this).attr('class','number' + (i+1));
    });
});

// itemsにナンバーをつける。そしてそのナンバーの番号と同じ数字のタスククラスを作る
$(function(){
    $('.contents .items').each(function(i){
        $(this).attr('class','number' + (i+1) +'-items');
        var num = i+1;
        $(this).children(".task").attr('class','number' + num +'-task');
    });
});

// $(function(){
//     $('.contents .task').each(function(i){
//         $(this).attr('class','number' + (i+1) +'-task');
//     });
// });

// 初期段階でnumber1以外見えないように指定
$(function(){
    $(".contents div").hide();
    $("." + 'number1' ).show();
    $("." + 'number1 div').show();
    // $("." + 'number1' +"-items").show()
    // $("." + 'number1' +"-task").show()
  });


// タブが変わると他のタスクは見えないようになっている
window.addEventListener("load", function() {
  $("li").on("click", function() {
    $("li.selected").removeClass("selected");
    $(this).addClass("selected");
    $(".contents div").hide();
    $("." + this.id ).show();
    $("." + this.id +"-items").show()
    $("." + this.id +"-task").show()
  });
});

