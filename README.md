# RandomUser

A phoenix api app, with a single endpoint.  This app will return, at max 2 (it can return less), users with more than a random number of points.

#### How it works
  * Clone this repo with `git clone https://github.com/niteshcode4u/random_user.git`
  * Go inside the folder after clone with `cd random_user`
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can send API request to the URL `http://localhost:4000` from your machine (Postman/ Curl).

#### Technical specifications & flows
  * Stacks used: Elixir, Postgres, GenServer, ExUnit for testing
  * Once you will run `mix ecto.setup` seed will generate `1,000,000` user seeds with points as `0`
  * Once application is started, GenServer will start with
    - State having random `min_number` & `timestamp` as `nil` Eg: `%{timestamp: nil, min_number: 35}`
    - Sends request internally on every minute time interval which will update all user's points value and 
      Also refresh the `min_number` value
    - Accepts `handle call` and return list of max 2 users with points more than `min_number` value
    - Just after return it's updating own state `timestamp` with query time
  * Accepts API request at the URL `http://localhost:4000` and return results in below structure (`Added screentshot for the same`)
   ```
   {
       "timestamp": "2022-12-13 04:50:08",
       "users": [
           {
               "id": 151066,
               "points": 83
           },
           {
               "id": 543139,
               "points": 78
           }
       ]
   }
   ```

#### Test coverage
![Screenshot 2022-12-13 at 10 53 07 AM](https://user-images.githubusercontent.com/20892499/207234184-13ede32e-f47e-409b-a8ed-c2df75135ff4.png)

#### Response structure in postman
<img width="1013" alt="Screenshot 2022-12-13 at 10 47 19 AM" src="https://user-images.githubusercontent.com/20892499/207234169-cfe002b7-dac4-4f47-980f-d3adf1c5653e.png">
