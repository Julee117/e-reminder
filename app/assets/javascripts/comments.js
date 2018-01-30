$(function() {
  $(".all-comments").on('click', function(e) {
    e.preventDefault();
    $.get(this.href + ".json", function(response) {
      const $div = $("div.comments")
      $div.fadeToggle()
      $div.html("")
      response.forEach(function(comment) {
        if (comment.content != "") {
          $div.append('<div class="comments-show">' + '<strong>' + comment.user.username.charAt(0).toUpperCase() + comment.user.username.slice(1) + '</strong>: ' + comment.content + '</div><br>')
        }
      })
    })
  })

  $("#new_comment").on("submit", function(e) {
    e.preventDefault();
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(response) {
        $("#comment_content").val("");
        if (response.content != "") {
          $div.append('<div class="comments-show">' + '<strong>' + response.user.username + '</strong>: ' + response.content + '</div><br>')
        }
      }
    });
  })
})
