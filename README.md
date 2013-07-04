# YoolkStyleguide

A mountable Rails engine where you can view yoolk internal styleguide.

## Installation

The simplest way to install is to use Bundler.

Add this gem to your Gemfile:

    group :assets do
      gem 'yoolk-styleguide', git: 'git://github.com/yoolk/yoolk-styleguide.git'
    end

Then, use Bundler to install the gem and its dependencies:

    $ bundle install

Last, run the Rails generator to configure your app:

    $ rails g yoolk_styleguide:install

The generator will install `guard-livereload` and `rack-livereload`.

## Authors

* [Vorleak Chy](https://github.com/vorleakchy)
* [Chamnap Chhorn](https://github.com/chamnap)

## Contributors

* [Sinal Meas](https://github.com/meassinal)
* [Vuthy San](https://github.com/sanvuthy)
* [Mony Prak](https://github.com/monyprak)
