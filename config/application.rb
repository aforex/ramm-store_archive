module Application
  module_function
  
  def env
    ENV['RACK_ENV'] || 'development'
  end
end
