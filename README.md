# README

## Setup the application.
###### Install `ruby 2.6.3p62`
###### Install `Rails 6.0.3.3`
###### clone the repo `https://github.com/sonu1989/c8cfa3ffc18d22a1f82a`
###### run the `bundle install`
###### run then `rake db:create rake:migrate` default it's using SQLite3 you can change it.
###### start the rails server `rails s`

## How to use API's
###### 1) GET /phones # Lists all allotted numbers
  - API URL: /api/v1/phones
  - Method Type: get
  - Response example:
  ```
  {
  "phones": [
        "5490362987",
        "3965932971",
        "9166744719",
        "4014733650"]
    }
   ```
      
###### 2) POST /phones # Allots a number
  - API URL: /api/v1/phones
  - Method Type: post
  - Response example: {"phone": "#"} # any random from given range.

###### 3) POST /phones/1111111111 # Allots the number 1111111111
  - API URL: /api/v1/phones/1111111111
  - Method Type: post
  - Response example: {"phone": "1111111111"} if number requested number is avaiable then it will return same number otherwise it will allot any uniq available random number.
    