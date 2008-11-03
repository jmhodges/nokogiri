
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
#     The "setValue()" method for an attribute causes the 
#   DOMException NO_MODIFICATION_ALLOWED_ERR to be raised
#   if the node is readonly.
#   Create an entity reference using document.createEntityReference()
#   Get the "domestic" attribute from the entity 
#   reference and execute the "setValue()" method.
#   This causes a NO_MODIFICATION_ALLOWED_ERR DOMException to be thrown.
# @author Curt Arnold
# see[http://www.w3.org/TR/2000/WD-DOM-Level-1-20000929/level-one-core#xpointer(id('ID-258A00AF')/constant[@name='NO_MODIFICATION_ALLOWED_ERR'])]
# see[http://www.w3.org/TR/2000/WD-DOM-Level-1-20000929/level-one-core#ID-221662474]
# see[http://www.w3.org/TR/2000/WD-DOM-Level-1-20000929/level-one-core#xpointer(id('ID-221662474')/setraises/exception[@name='DOMException']/descr/p[substring-before(.,':')='NO_MODIFICATION_ALLOWED_ERR'])]
# see[http://www.w3.org/DOM/updates/REC-DOM-Level-1-19981001-errata.html]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-221662474]
# see[http://www.w3.org/2001/DOM-Test-Suite/level1/core/attrsetvaluenomodificationallowederr.xml]
##
DOMTestCase('attrsetvaluenomodificationallowederrEE') do

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
  def test_attrsetvaluenomodificationallowederrEE
    doc = nil
    entRef = nil
    entElement = nil
    attrList = nil
    attrNode = nil
    gender = nil
    genderList = nil
    appendedChild = nil
    doc = load_document("staff", true)
      genderList = doc.getElementsByTagName("gender")
      gender = genderList.item(2)
      assert_not_nil(gender, "genderNotNull")
      entRef = doc.createEntityReference("ent4")
      assert_not_nil(entRef, "entRefNotNull")
      appendedChild = gender.appendChild(entRef)
      entElement = entRef.firstChild()
      assert_not_nil(entElement, "entElementNotNull")
      attrList = entElement.attributes()
      attrNode = attrList.getNamedItem("domestic")
      
    begin
      success = false;
      begin
        attrNode.value = "newvalue"
      rescue Nokogiri::XML::DOMException => ex
        success = (ex.code == Nokogiri::XML::DOMException::NO_MODIFICATION_ALLOWED_ERR)
      end 
      assert(success, "setValue_throws_NO_MODIFICATION")
    end

    begin
      success = false;
      begin
        attrNode.nodeValue = "newvalue2"
      rescue Nokogiri::XML::DOMException => ex
        success = (ex.code == Nokogiri::XML::DOMException::NO_MODIFICATION_ALLOWED_ERR)
      end 
      assert(success, "setNodeValue_throws_NO_MODIFICATION")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/attrsetvaluenomodificationallowederrEE"
  end
end

