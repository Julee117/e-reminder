# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
  - Rendered current user's events show page and allow user to sift through that day's events by clicking a next and previous button.
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
  - Rendered comments index and appended comments onto events show page.
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
  - User and Event has many comments. Comments were rendered onto events show page.
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
  - Created post request to submit comment.
- [x] Translate JSON responses into js model objects.
  - Created Event and Location constructor functions.
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
  - Added function to prototype to concatenate location street_address, city, state and zipcode.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
