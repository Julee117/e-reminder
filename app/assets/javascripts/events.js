$(function() {
  $(".next-event").on('click', function(e) {
    e.preventDefault()
    let id= $(this).attr('data-id')
    $.get(`${id}/next`, function(data) {
      $(".show").html("")
      let newEvent = new Event(data)
      let event = newEvent.displayEvent()
      $(".show").append(event)
      $(".next-event").attr("data-id", data["id"])
      $(".prev-event").attr("data-id", data["id"])
      history.pushState({}, "", data["id"])
      $(".all-comments").attr("href", `/events/${data["id"]}/comments`)
    })
  })

  $(".prev-event").on('click', function(e) {
    e.preventDefault()
    let id= $(this).attr('data-id')
    $.get(`${id}/prev`, function(data) {
      $(".show").html("")
      let newEvent = new Event(data)
      let event = newEvent.displayEvent()
      $(".show").append(event)
      $(".prev-event").attr("data-id", data["id"])
      $(".next-event").attr("data-id", data["id"])
      history.pushState({}, "", data["id"])
      $(".all-comments").attr("href", `/events/${data["id"]}/comments`)
    })
  })
})

function Event(event) {
  this.id = event.id
  this.title = event.title
  this.date = event.date
  this.start_time = event.start_time
  this.end_time = event.end_time
  this.note = event.note
  this.creator = event.creator
  this.users = event.users
  this.location = event.location
  this.comments = event.comments
}

Event.prototype.convertToDate = function() {
  splitDateTime = (this.date).split("T");
  parts = splitDateTime[0].split("-");
  eventDate = new Date(parts[0], parts[1] - 1, parts[2]);
  dateParts = eventDate.toDateString().split(" ");
  return `${dateParts[1]} ${dateParts[2]}, ${dateParts[3]}`
}

Event.prototype.convertStartTime = function() {
  dateFormat = new Date(this.start_time);
  timeString = dateFormat.toLocaleTimeString();
  parts = timeString.split(":");
  return `${parts[0]}:${parts[1]} ${parts[2].slice(3)}`
}

Event.prototype.convertEndTime = function() {
  dateFormat = new Date(this.end_time);
  timeString = dateFormat.toLocaleTimeString();
  parts = timeString.split(":");
  return `${parts[0]}:${parts[1]} ${parts[2].slice(3)}`
}

Event.prototype.displayAddress = function() {
  let addressHtml = `
  Address: ${this.location.street_address} ${this.location.city} ${this.location.state} ${this.location.zipcode}
  `
  return addressHtml
}

Event.prototype.noteLocationName = function() {
  if (this.note !== "") {
    return `<p>Note: ${this.note}</p><p>Location: ${this.location.name}</p>`
  } else {
    return `<p>Location: ${this.location.name}</p>`
  }
}

Event.prototype.getUsers = function() {
  return (this.users).map(function(user) {
    return user.username;
  }).join(", ")
}

Event.prototype.displayEvent = function() {
  let eventHtml = `
  <h1>${this.title}</h1>
  <p>Date: ${this.convertToDate()}</p>
  <p>Start Time: ${this.convertStartTime()}</p>
  <p>End Time: ${this.convertEndTime()}</p>
  ${this.noteLocationName()}
  <p>${this.displayAddress()}</p>
  <p>Creator: ${this.creator}</p>
  <p>Notified: ${this.getUsers()}</p>
  `
  return eventHtml
}
