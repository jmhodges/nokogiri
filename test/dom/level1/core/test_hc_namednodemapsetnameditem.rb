
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001-2004 World Wide Web Consortium,
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
#    Retrieve the second "p" element and create a NamedNodeMap 
#    object from the attributes of the last child by
#    invoking the "getAttributes()" method.  Once the
#    list is created an invocation of the "setNamedItem(arg)"
#    method is done with arg=newAttr, where newAttr is a
#    new Attr Node previously created.  The "setNamedItem(arg)"
#    method should add then new node to the NamedNodeItem 
#    object by using its "nodeName" attribute("lang').
#    This node is then retrieved using the "getNamedItem(name)"
#    method.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-1025163788]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-349467F9]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=236]
# see[http://lists.w3.org/Archives/Public/www-dom-ts/2003Jun/0011.html]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=243]
##
DOMTestCase('hc_namednodemapsetnameditem') do

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
  def test_hc_namednodemapsetnameditem
    doc = nil
    elementList = nil
    newAttribute = nil
    testAddress = nil
    attributes = nil
    districtNode = nil
    attrName = nil
    setNode = nil
    doc = load_document("hc_staff", true)
      elementList = doc.getElementsByTagName("acronym")
      testAddress = elementList.item(1)
      newAttribute = doc.createAttribute("lang")
      attributes = testAddress.attributes()
      setNode = attributes.setNamedItem(newAttribute)
      districtNode = attributes.getNamedItem("lang")
      attrName = districtNode.nodeName()
      assertEqualsAutoCase("attribute", "nodeName", "lang", attrName)
        
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_namednodemapsetnameditem"
  end
end
