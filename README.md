# Instagram Subscribers Impoprter

``` bash
bundle install
bundle exec ruby bin/import.rb
```

## Set up

- Create a new [request bin](https://requestb.in) to be used as redirect URI.
- Register a [new Instagram application](https://www.instagram.com/developer/), and acquire `client id` and `client secret values`.
- Opent this URL in browser:

  ```
  https://api.instagram.com/oauth/authorize/?client_id=...&redirect_uri=...&response_type=code&scope=basic+public_content+follower_list
  ```

- Pick the `code` value from the pastebin.
- Execute authorization API call:

  ```
  curl -F 'client_id=...' \
       -F 'client_secret=...' \
       -F 'grant_type=authorization_code' \
       -F 'redirect_uri=...' \
       -F 'code=...' https://api.instagram.com/oauth/access_token
  ```

- Pick `access_token` value from JSON response.
- Pull followers list:

  ```
  https://api.instagram.com/v1/users/self/followed-by?access_token=...
  ```
