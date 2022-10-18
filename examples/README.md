# Example: Rack App of Rack::ChangePasswordUrl
## Usage
- Installation
```sh
$ bundle install
```

- Start Rack App
```sh
$ bundle exec ruby config.ru
```

- Check endpoint of a Well-Known URL for Changing Passwords.
```sh
$ curl -I http://localhost:9292/.well-known/change-password
HTTP/1.1 302 Found
Location: /your-redirect-path
Content-Length: 0
```
