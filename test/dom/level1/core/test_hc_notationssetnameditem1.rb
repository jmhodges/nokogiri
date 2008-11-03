
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2004 World Wide Web Consortium,
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
# An attempt to add an element to the named node map returned by notations should 
# result in a NO_MODIFICATION_ERR or HIERARCHY_REQUEST_ERR.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-D46829EF]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-1025163788]
##
DOMTestCase('hc_notationssetnameditem1') do

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
  def test_hc_notationssetnameditem1
    doc = nil
    notations = nil
    docType = nil
    retval = nil
    elem = nil
    doc = load_document("hc_staff", true)
      docType = doc.doctype()
      
      if (
    !(("text/html" == getContentType()))
)
        assert_not_nil(docType, "docTypeNotNull")
      notations = docType.notations()
      assert_not_nil(notations, "notationsNotNull")
      elem = doc.createElement("br")
      
      begin
      retval = notations.setNamedItem(elem)
      fail("throw_HIER_OR_NO_MOD_ERR")
     rescue DOMException => ex
           case ex.code
      when 3 : 
       # break;
      when 7 : 
       # break;
          else
          raise ex
          end
        
      end # end begin
      

         end
       
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_notationssetnameditem1"
  end
end

