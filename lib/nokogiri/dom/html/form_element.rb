module Nokogiri
  module DOM
    module HTML
      module FormElement
        def elements
          xpath('.//select')
        end
      end
    end
  end
end