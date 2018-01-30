$(function() {
  $(".next-event").on('click', function(e) {
    e.preventDefault()
    let id= $(this).attr('data-id')
    $.get(`${id}/next`, function(data) {
      $('.event-show').html("")
      let newEvent = new Event(data)
      let event = newEvent.displayEvent()

      $('.event-show').append(event)
    })
  })

  function Event(event) {
    this.id = event.id
    this.title = event.title
    this.date = event.date
    this.start_time = event.start_time
    this.end_time = event.end_time
    this.creator = event.creator
  }
})
