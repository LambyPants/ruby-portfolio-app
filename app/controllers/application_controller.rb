class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

end

def set_copyright
  @copyright = RLambertViewTool::Renderer.copyright 'Ryan Lambert', 'All rights reserved'
  end
end

module RLambertViewTool
  class Renderer
    def self.copyright name, msg
      "&copy: #{Time.now.year} | <b> #{name} </b> #{msg}".html_safe
    end
  end
end
