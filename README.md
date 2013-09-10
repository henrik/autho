# Autho

**NOTE:** Very much a work in progress.

A many-stop-shop for authentication.

I've looked at various authentication gems and feel they do too much. I don't want a framework where I override some things. I want a helpful library to handle some things and leave me to bring it all together.

If you agree, Autho may be for you.

Autho is made to work well with Rails but not to be tied to it.

## Installation

Add this line to your application's Gemfile:

    gem 'autho'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install autho

## Usage

Todo. See specs.

Current parts:

  * `Autho::Authentication` to find a user from email and password.
  * `Autho::Session` to store, get and remove user from the session.

## TODO

* More specs
* Polish API
* Depend and document the redirect-after-logging-in gem
* "Remember me"?

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
