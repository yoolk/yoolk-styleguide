require 'bootstrap-sass'

module Yoolk
  module Styleguide
    class Engine < ::Rails::Engine
      isolate_namespace Yoolk::Styleguide
    end
  end
end