# Dragonfly::Cloudinary

Simple Cloudinary data store for Dragonfly.

## Installation

Add this line to your application's Gemfile:

    gem 'dragonfly-cloudinary'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dragonfly-cloudinary

## Usage

Set up Cloudinary account, download your cloudinary.yml, and add this to your dragonfly initializer:

```ruby
app = Dragonfly[:images]
app.datastore = Dragonfly::DataStorage::CloudinaryStore.new
```

You don't need to configure datastore itself, it will use your cloudinary settings.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
