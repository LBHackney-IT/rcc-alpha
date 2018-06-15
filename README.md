# RCC alpha

# Setup

You will either need access to the Hackney API, or set up [Mock Hackney API](https://github.com/LBHackney-IT/mock_hackney_api) locally.

If you run Mock Hackney API on port 3001 using `rails s -p 3001`, then add `HACKNEY_API_ROOT=http://localhost:3001` to this app's .env file and:

- `bundle`
- `rake db:setup`
- `rails s`

and visit http://localhost:3000/properties
