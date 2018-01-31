$(function() {
  $(".popular-loc").on('click', function(e) {
    e.preventDefault()
    history.pushState({}, "", "/most_popular")
    $.get("/most_popular.json", function(response) {
      $("#main").html("")
      let $main = $("#main").append(heading())
      response.forEach(function(location) {
        let newLocation = new Location(location)
        let locHtml = newLocation.formatPopular()
        $("div.location ol").append(locHtml)
      })
    })
  })

  $(document).on('click', ".show_location", function(e) {
    e.preventDefault()
    let id= $(this).attr('data-id')
    history.pushState({}, "", `${id}`)
    $.get(`/locations/${id}.json`, function(data) {
      $("#main").html("")
      let newLocation = new Location(data)
      let locHtml = newLocation.formatShow()
      $("#main").append(locHtml)
    })
  })

  $(document).on('click', '.next-location', function(e) {
    e.preventDefault()
    let id= $(this).attr('data-id')
    $.get(`${id}/next`, function(data) {
      $("#main").html("")
      let newLocation = new Location(data)
      let locHtml = newLocation.formatShow()
      $("#main").append(locHtml)
      $(".next-location").attr("data-id", data["id"])
      history.pushState({}, "", data["id"])
    })
  })

  $(document).on('click', '.prev-location', function(e) {
    e.preventDefault()
    let id= $(this).attr('data-id')
    $.get(`${id}/prev`, function(data) {
      $("#main").html("")
      let newLocation = new Location(data)
      let locHtml = newLocation.formatShow()
      $("#main").append(locHtml)
      $(".prev-location").attr("data-id", data["id"])
      history.pushState({}, "", data["id"])
    })
  })
})

function Location(location) {
  this.id = location.id
  this.name = location.name
  this.street_address = location.street_address
  this.city = location.city
  this.state = location.state
  this.zipcode = location.zipcode
}

Location.prototype.formatPopular = function() {
  let popularHtml = `
  <li class="popular"><a href="/locations/${this.id}" class="show_location" data-id="${this.id}">${this.name}</a></li>
  `
  return popularHtml
}

Location.prototype.formatShow = function() {
  let showHtml = `
  <div class="location">
    <h1>${this.name}</h1>
    <p class="show">Address: ${this.street_address} ${this.city} ${this.state} ${this.zipcode}<p>
  </div><br>
  <button class="prev-location btn btn-primary btn-xs"" data-id="${this.id}">Prev Location</button>
  <button class="next-location btn btn-primary btn-xs"" data-id="${this.id}">Next Location</button>
  `
  return showHtml
}

function heading() {
  let header = `
  <div class="location">
  <h2>Most Popular Locations</h2>
  <div class="loc">
    <ol>
    </ol>
  </div>
  `
  return header
}
