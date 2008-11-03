
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
#     The "getLength()" method returns the number of nodes
#    in the list.(Test for EMPTY list)
#    
#    Create a list of all the children of the Text node 
#    inside the first child of the third employee and
#    invoke the "getLength()" method.   It should contain
#    the value 0.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-203510337]
##
DOMTestCase('nodelistindexgetlengthofemptylist') do

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
  def test_nodelistindexgetlengthofemptylist
    doc = nil
    elementList = nil
    employeeNode = nil
    employeeList = nil
    childNode = nil
    textNode = nil
    textList = nil
    doc = load_document("staff", false)
      elementList = doc.getElementsByTagName("employee")
      employeeNode = elementList.item(2)
      employeeList = employeeNode.childNodes()
      childNode = employeeList.item(1)
      textNode = childNode.firstChild()
      textList = textNode.childNodes()
      assertSize("nodelistIndexGetLengthOfEmptyListAssert", 0, textList)
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/nodelistindexgetlengthofemptylist"
  end
end

