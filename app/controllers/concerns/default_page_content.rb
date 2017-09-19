module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end
      def set_page_defaults
        @page_title = "Ryan's Ruby Portfolio"
        @seo_keywords = "Ryan Lambert developer portfolio"
    end
end
