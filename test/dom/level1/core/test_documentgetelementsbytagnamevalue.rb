
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

require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'helper'))

###
#     The "getElementsByTagName(tagName)" method returns a 
#    NodeList of all the Elements with a given tagName
#    in a pre-order traversal of the tree.
#    
#    Retrieve the entire DOM document and invoke its 
#    "getElementsByTagName(tagName)" method with tagName
#    equal to "name".  The method should return a NodeList 
#    that contains 5 elements.  The FOURTH item in the
#    list is retrieved and output.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-A6C9094]
##
DOMTestCase('documentgetelementsbytagnamevalue') do

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
    preload(contentType, "staff", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_documentgetelementsbytagnamevalue
    doc = nil
    nameList = nil
    nameNode = nil
    firstChild = nil
    childValue = nil
    doc = load_document("staff", false)
      nameList = doc.getElementsByTagName("name")
      nameNode = nameList.item(3)
      firstChild = nameNode.firstChild()
      childValue = firstChild.nodeValue()
      assert_equal("Jeny Oconnor", childValue, "documentGetElementsByTagNameValueAssert")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/documentgetelementsbytagnamevalue"
  end
end

