
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
#     Every node in the map returned by the "getEntities()"
#    method implements the Entity interface.
#    
#    Retrieve the Document Type for this document and create 
#    a NamedNodeMap of all its entities.  Traverse the 
#    entire list and examine the NodeType of each node
#    in the list.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-1788794630]
##
DOMTestCase('documenttypegetentitiestype') do

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
  def test_documenttypegetentitiestype
    doc = nil
    docType = nil
    entityList = nil
    entity = nil
    entityType = nil
    doc = load_document("staff", false)
      docType = doc.doctype()
      assert_not_nil(docType, "docTypeNotNull")
      entityList = docType.entities()
      assert_not_nil(entityList, "entitiesNotNull")
      indexid1437602 = 0
    while (indexid1437602 < entityList.length)
      entity = entityList.item(indexid1437602)
    entityType = entity.nodeType()
      assert_equal(6, entityType, "documenttypeGetEntitiesTypeAssert")
            indexid1437602 += 1
            end
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/documenttypegetentitiestype"
  end
end

