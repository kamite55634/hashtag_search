$(function () {
  $(".times").click(function () {
    var hashtag = $(this).next(".hash_name").html()
    $.ajax({
      type: "GET",
      url: "home/delete_hashtag",
      data: { hashtag: hashtag },
      dataType: "json"
    })
      .done(function (data) {
        console.log(data)
        $("#result").text(data.length + "件検索結果を表示しています")
        $("#hash_" + hashtag).empty()
        $("#submissions").empty()
        $.each(data, function (index, submission) {

          $("#submissions").append('<div class="box" id="box_' + index + '"><div class="created_at"></div > <div class="text"></div> <p class="hashtags"></p></div > ')

          var created_at = submission.created_at
          $("#box_" + index).find(".created_at").text(created_at)

          var text = submission.text
          $("#box_" + index).find(".text").text(text)

          hashtags = []
          $.each(submission.hashtags, function (index) {
            var hashtag = submission.hashtags[index].hashtag
            hashtags.push(" #" + hashtag)
          })
          $("#box_" + index).find(".hashtags").text(hashtags.join(""))
        })
      })
      .fail(function () {
        // 通信に失敗した場合の処理です
        alert('削除に失敗しました') // alertで検索失敗の旨を表示します
      })
  });
});