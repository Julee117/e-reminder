# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  - Location has_many events.
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  - Calendar belongs_to User. Event belongs_to Location.
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  - Event has_many Calendars through Notifications.
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  - Created methods user.sort_by_date where it sorts the user's calendars events by date and user.today_events where it finds today's events of the user.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  - Validate all the attributes for locations and users. Validate title of events.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  - Class method to find the top 5 most popular locations with URL of /locations/most_popular.
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
  - Created nested form with calendar and events. Created custom attribute writer for locations to find location that has already been created and if not, to create it.
- [x] Include signup (how e.g. Devise)
  - User can signup through users#new.
- [x] Include login (how e.g. Devise)
  - User can login through sessions#new.
- [x] Include logout (how e.g. Devise)
  - User can logout through sessions#destroy.
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  - User facebook to signup/login.
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  - calendars/name/events/1
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
  - calendars/name/events
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  - Displays validation errors if user does not fill out required fields.

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
