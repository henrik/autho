# Autho

**NOTE:** Not maintained!

A many-stop shop for authentication.

I've looked at various authentication gems and feel they do too much. I don't want a framework where I override some things. I want a helpful library to handle some things and leave me to bring it all together.

If you agree, Autho may be for you.

Autho is made to work well with Rails and Active Record but not to be tied to it. We're using it with [Minimapper](http://github.com/joakimk/minimapper) on one project.

## Installation

Add this line to your application's Gemfile:

    gem 'autho'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install autho

## Usage

Todo. See `spec` and `examples` dirs.

Current parts:

  * `Autho::Authentication` to find a user from email and password.
  * `Autho::Session` to store, get and remove user from the session.


## FAQ

### How about "remember me" functionality?

We haven't had the need for a checkbox with this library; we just remember all sessions for a long time.

Just add something like `expire_after: 12.months` to the session cookie options in Rails' `config/initializers/session_store.rb`.


## Related

* [ActiveModel::SecurePassword](http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html) for encrypting passwords, validating confirmation etc.
* [go_to_param](https://github.com/henrik/go_to_param/) to redirect where you wanted to go after logging in.


## TODO

* Polish API
* Replicate SecurePassword?
* Memoize in session?
* Examples of use in real code, maybe something like a sample app


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
