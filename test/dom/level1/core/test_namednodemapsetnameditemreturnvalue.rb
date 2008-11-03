
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
#     If the "setNamedItem(arg)" method replaces an already 
#    existing node with the same name then the already 
#    existing node is returned.
#    
#    Retrieve the third employee and create a NamedNodeMap 
#    object from the attributes of the last child by
#    invoking the "getAttributes()" method.  Once the
#    list is created an invocation of the "setNamedItem(arg)"
#    method is done with arg=newAttr, where newAttr is a
#    new Attr Node previously created and whose node name
#    already exists in the map.  The "setNamedItem(arg)"
#    method should replace the already existing node with
#    the new one and return the existing node.   
#    This test uses the "createAttribute(name)" method from
#    the document interface.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-1025163788]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-349467F9]
##
DOMTestCase('namednodemapsetnameditemreturnvalue') do

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
    preload(contentType, "staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_namednodemapsetnameditemreturnvalue
    doc = nil
    elementList = nil
    newAttribute = nil
    testAddress = nil
    attributes = nil
    newNode = nil
    attrValue = nil
    doc = load_document("staff", true)
      elementList = doc.getElementsByTagName("address")
      testAddress = elementList.item(2)
      newAttribute = doc.createAttribute("street")
      attributes = testAddress.attributes()
      newNode = attributes.setNamedItem(newAttribute)
      attrValue = newNode.nodeValue()
      assert_equal("No", attrValue, "returnedNodeValue")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/namednodemapsetnameditemreturnvalue"
  end
end

