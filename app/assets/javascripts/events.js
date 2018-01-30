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

  Event.prototype.convertToDate = function() {
    splitDateTime = `${this.date}`.split("T");
    parts = splitDateTime[0].split("-");
    eventDate = new Date(parts[0], parts[1] - 1, parts[2]);
    dateParts = eventDate.toDateString().split(" ");
    return `${dateParts[1]} ${dateParts[2]}, ${dateParts[3]}`
  }

})
