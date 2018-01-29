$(function() {
  $(".all-comments").on('click', function(e) {
    e.preventDefault()
    $.get(this.href + ".json").success(function(response) {
      const $div = $("div.comments")
      $div.html("")
      response.forEach(function(comment) {
        $div.append('<div class="comments-show">' + '<strong>' + comment.user.username + '</strong>: ' + comment.content + '</div><br>')
      })
    })
  })
})
