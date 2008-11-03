
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
# The "getElementsByTagName(name)" method may use the
# special value "*" to match all tags in the element
# tree.
# Create a NodeList of all the descendant elements
# of the last employee by using the special value "*".
# The method should return all the descendant children(6)
# in the order the children were encountered.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-1938918D]
##
DOMTestCase('hc_elementgetelementsbytagnamespecialvalue') do

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
    preload(contentType, "hc_staff", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_hc_elementgetelementsbytagnamespecialvalue
    doc = nil
    elementList = nil
    lastEmployee = nil
    lastempList = nil
    child = nil
    childName = nil
    result = []
      
    expectedResult = []
      expectedResult << "em"
      expectedResult << "strong"
      expectedResult << "code"
      expectedResult << "sup"
      expectedResult << "var"
      expectedResult << "acronym"
      
    doc = load_document("hc_staff", false)
      elementList = doc.getElementsByTagName("p")
      lastEmployee = elementList.item(4)
      lastempList = lastEmployee.getElementsByTagName("*")
      indexid3205051 = 0
    while (indexid3205051 < lastempList.length)
      child = lastempList.item(indexid3205051)
    childName = child.nodeName()
      result << childName
      indexid3205051 += 1
            end
      assertEqualsAutoCase("element", "tagNames", expectedResult, result)
        
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_elementgetelementsbytagnamespecialvalue"
  end
end

