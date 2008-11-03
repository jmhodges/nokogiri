
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001 World Wide Web Consortium,
(Massachusetts Institute of Technology, Institut National de
Recherche en Informatique et en Automatique, Keio University). All
Rights Reserved. This program is distributed under the W3C's Software
Intellectual Property License. This program is distributed in the
hope that it will be useful, but WITHOUT ANY WARRANTY; without even
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.
See W3C License http://www.w3.org/Consortium/Legal/ for more details.

=end
#

require 'dom_test_case'

###
#     The "createElement(tagName)" method creates an Element 
#    of the type specified.
#    Retrieve the entire DOM document and invoke its 
#    "createElement(tagName)" method with tagName="acronym".
#    The method should create an instance of an Element node
#    whose tagName is "acronym".  The NodeName, NodeType 
#    and NodeValue are returned.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-2141741547]
##
DOMTestCase('hc_documentcreateelement') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
    ##
    ##   check if loaded documents are supported for content type
    ##
    contentType = getContentType()
    preload(contentType, "hc_staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_hc_documentcreateelement
    doc = nil
    newElement = nil
    newElementName = nil
    newElementType = nil
    newElementValue = nil
    doc = load_document("hc_staff", true)
      newElement = doc.createElement("acronym")
      newElementName = newElement.nodeName()
      assertEqualsAutoCase("element", "strong", "acronym", newElementName)
        newElementType = newElement.nodeType()
      assert_equal(1, newElementType, "type")
            newElementValue = newElement.nodeValue()
      assert_nil(newElementValue, "valueInitiallyNull")
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_documentcreateelement"
  end
end
