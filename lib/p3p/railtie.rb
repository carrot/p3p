module P3P
  # Responsible for applying middleware to Rails projects
  class Railtie < Rails::Railtie
    initializer 'p3p.middleware' do |app|
      app.middleware.use Middleware
    end
  end
end
