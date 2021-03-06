$(function () {
  $(document).on("click", ".times", function () {
    $("#loading").addClass("loading")
    var hashtag = $(this).next(".hash_name").html()
    $.ajax({
      type: "GET",
      url: "home/delete_hashtag",
      data: { hashtag: hashtag },
      dataType: "json"
    }).done(function (data) {
      console.log(data)

      var hash_length = $(".searching_hashtags").children().length
      if (hash_length == 1) {
        $("#result").text("全ての投稿を表示しています")
      } else {
        $("#result").text(data.length + "件検索結果を表示しています")
      }

      $("#hash_" + hashtag).remove()

      show_hashtag(data)

    }).fail(function () {
      // 通信に失敗した場合の処理です
      alert('削除に失敗しました') // alertで検索失敗の旨を表示します
    })
  });

  $(document).on("click", "#search_btn", function () {
    $("#loading").addClass("loading")
    var search_text = $("#search").val()
    $("#search").val("")
    $.ajax({
      type: "GET",
      url: "home/search",
      data: { text: search_text },
      dataType: "json"

    }).done(function (data) {
      console.log(data)
      $("#result").text(data.length + "件検索結果を表示しています");
      if (search_text) {
        searches = search_text.split(/ |　/)

        var children = $(".searching_hashtags").children();

        $.each(searches, function (index, search) {

          hashtag_double = true
          $.each(children, function (index, child) {
            if (child.id == "hash_" + search) {
              hashtag_double = false
            }
          });
          if (hashtag_double && search) {
            $(".searching_hashtags").append('<span id="hash_' + search + '"> [<span class="times" id="times"> x </span> # <span class="hash_name">' + search + '</span>]</span>')
          }
        })
      }

      show_hashtag(data)

    }).fail(function () {
      // 通信に失敗した場合の処理です
      alert('削除に失敗しました') // alertで検索失敗の旨を表示します
    })
  })

  function show_hashtag(data) {
    $("#submissions").empty()
    $.each(data, function (index, submission) {

      $("#submissions").append('<div class="box" id="box_' + index + '"><div class="created_at"></div > <div class="text"></div> <p class="hashtags"></p></div > ')

      let date = new Date(submission.created_at)
      let YYYY = date.getFullYear();
      let MM = date.getMonth() + 1;
      let DD = date.getDate();
      let hh = date.getHours();
      let mm = date.getMinutes();
      let created_at = YYYY + "-" + MM + "-" + DD + " " + hh + ":" + mm
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
    $("#loading").removeClass("loading")
  }
});