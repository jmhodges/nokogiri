require 'nokogiri/syntax_error'
module Nokogiri
  module XML
    module SAX
      class SyntaxError < ::Nokogiri::SyntaxError
      end
    end
  end
end
