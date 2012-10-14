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

## Cloudinary urls

You can generate direct urls for stored image in cloudinary using `image.remote_url`. See [Dragonfly documentation for this](http://markevans.github.com/dragonfly/file.ServingRemotely.html).

You can pass any options that cloudinary supports, e.g. `image.remote_url(width: 100, height: 100, crop: :crop)`. See more at [Cloudinary documentation](http://cloudinary.com/documentation/image_transformations)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
