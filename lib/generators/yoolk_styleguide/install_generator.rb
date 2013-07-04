require "rails/generators"

module YoolkStyleguide
  class InstallGenerator < ::Rails::Generators::Base
    desc "Styleguide installation generator"
    def install
      should_bundle = ensure_rack_livereload.nil?
      should_bundle = ensure_guard_livereload.nil? || should_bundle
      bundle_command("install") if should_bundle

      configure_guard_livereload
      configure_development
      mount_styleguide
    end

    no_tasks do
      def guardfile
        @guardfile ||= if File.exists?(guardfile_path)
          File.open(guardfile_path).read
        end
      end

      def application_rb
        @application_rb ||= File.open(application_rb_path).read
      end

      def development_rb
        @development_rb ||= File.open(development_rb_path).read
      end

      def routes_rb
        @routes_rb ||= File.open(routes_rb_path).read
      end

      def default_partial_path
        'Rails.root.join("app/views/yoolk_styleguide/**/*")'
      end
    end

    private
    def guardfile_path
      Rails.root.join("Guardfile")
    end

    def application_rb_path
      Rails.root.join("config", "application.rb")
    end

    def development_rb_path
      Rails.root.join("config", "environments", "development.rb")
    end

    def routes_rb_path
      Rails.root.join("config", "routes.rb")
    end

    def ensure_rack_livereload
      Rack.const_get("LiveReload")
    rescue NameError
      gem "rack-livereload", :group => "development"
      nil
    end

    def ensure_guard_livereload
      Guard.const_get("LiveReload")
    rescue NameError
      gem "guard-livereload", :group => "development"
      nil
    end

    def bundle_command(command)
      say_status :run, "bundle #{command}"

      Dir.chdir(Rails.root) do
        oldrubyopt = ENV["RUBYOPT"]
        ENV["RUBYOPT"] = nil
        system("#{Gem.bin_path('bundler', 'bundle')} #{command}")
        ENV["RUBYOPT"] = oldrubyopt
      end
    end

    def configure_guard_livereload
      unless guardfile && guardfile.include?("guard 'livereload'")
        bundle_command("exec guard init livereload")
      end
    end

    def configure_development
      unless development_rb && development_rb.include?("Rack::LiveReload")
        application("config.middleware.insert_before(::Rack::Lock, ::Rack::LiveReload, min_delay: 500) if defined?(Rack::LiveReload)", env: "development")
      end
    end

    def mount_styleguide
      unless routes_rb && routes_rb.include?("mount YoolkStyleguide::Engine")
        route(%(mount YoolkStyleguide::Engine, at: "/styleguide" unless Rails.env.production?))
      end
    end
  end
end