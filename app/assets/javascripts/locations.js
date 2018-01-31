$(function() {
  $(".popular-loc").on('click', function(e) {
    e.preventDefault()
    history.pushState(null, null, "locations/most_popular")
    $.get("/locations/most_popular.json", function(response) {
      $("#main").html("")
      let $main = $("#main").append(heading())
      response.forEach(function(location) {
        let newLocation = new Location(location)
        let locHtml = newLocation.formatPopular()
        console.log(locHtml)
        $("div.location ol").append(locHtml)
      })
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
  <li class="popular"><a href="/location/${this.id}">${this.name}</a></li>
  `
  return popularHtml
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
