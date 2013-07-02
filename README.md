# Yoolk::StyleGuide

A mountable Rails engine where you can view yoolk internal styleguide.

## Installation

The simplest way to install is to use Bundler.

Add this gem to your Gemfile:

    group :assets do
      gem 'yoolk-styleguide', git: 'git://github.com/yoolk/yoolk-styleguide.git'
    end

Then, use Bundler to install the gem and its dependencies:

    $ bundle install

Last, mount this engine in your `config/routes.rb`.

    mount Yoolk::Styleguide::Engine, at: '/styleguide' unless Rails.env.production?

## Authors

* [Vorleak Chy](https://github.com/vorleakchy)
* [Chamnap Chhorn](https://github.com/chamnap)

## Contributors

* [Sinal Meas](https://github.com/meassinal)
* [Victory Someth](https://github.com/somethvictory)
* [Vuthy San](https://github.com/sanvuthy)
