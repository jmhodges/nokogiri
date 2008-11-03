
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001-2003 World Wide Web Consortium,
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
#    Create a list of all the children elements of the third
#    employee and access its last child by invoking the 
#    "item(index)" method with an index=length-1.  This should
 #    result in node with nodeName="#text" or acronym.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-844377136]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=246]
##
DOMTestCase('hc_nodelistreturnlastitem') do

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
  def test_hc_nodelistreturnlastitem
    doc = nil
    elementList = nil
    employeeNode = nil
    employeeList = nil
    child = nil
    childName = nil
    index = nil
    doc = load_document("hc_staff", false)
      elementList = doc.getElementsByTagName("p")
      employeeNode = elementList.item(2)
      employeeList = employeeNode.childNodes()
      index = employeeList.length()
      index -= 1
    child = employeeList.item(index)
      childName = child.nodeName()
      
      if (equals(12, index))
        assert_equal("#text", childName, "lastNodeName_w_whitespace")
            
          else
            assertEqualsAutoCase("element", "lastNodeName", "acronym", childName)
        assert_equal(5, index, "index")
            
         end
       
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_nodelistreturnlastitem"
  end
end

