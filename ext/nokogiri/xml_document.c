#include <xml_document.h>

static void dealloc(xmlDocPtr doc)
{
  NOKOGIRI_DEBUG_START(doc);
  doc->_private = NULL;
  xmlFreeDoc(doc);
  NOKOGIRI_DEBUG_END(doc);
}

/*
 * call-seq:
 *  url
 *
 * Get the url name for this document.
 */
static VALUE url(VALUE self)
{
  xmlDocPtr doc;
  Data_Get_Struct(self, xmlDoc, doc);

  if(doc->URL)
    return rb_str_new2((const char *)doc->URL);

  return Qnil;
}

/*
 * call-seq:
 *  serialize
 *
 * Serialize this document
 */
static VALUE serialize(VALUE self)
{
  xmlDocPtr doc;
  xmlChar *buf;
  int size;
  Data_Get_Struct(self, xmlDoc, doc);

  xmlDocDumpMemory(doc, &buf, &size);
  VALUE rb_str = rb_str_new((char *)buf, (long)size);
  xmlFree(buf);
  return rb_str;
}

/*
 * call-seq:
 *  root=
 *
 * Set the root element on this document
 */
static VALUE set_root(VALUE self, VALUE root)
{
  xmlDocPtr doc;
  xmlNodePtr new_root;

  Data_Get_Struct(self, xmlDoc, doc);
  Data_Get_Struct(root, xmlNode, new_root);

  xmlDocSetRootElement(doc, new_root);
  return root;
}

/*
 * call-seq:
 *  root
 *
 * Get the root node for this document.
 */
static VALUE root(VALUE self)
{
  xmlDocPtr doc;
  Data_Get_Struct(self, xmlDoc, doc);

  xmlNodePtr root = xmlDocGetRootElement(doc);

  if(!root) return Qnil;
  return Nokogiri_wrap_xml_node(root) ;
}

/*
 * call-seq:
 *  encoding
 *
 * Get the encoding for this Document
 */
static VALUE encoding(VALUE self)
{
  xmlDocPtr doc;
  Data_Get_Struct(self, xmlDoc, doc);

  if(!doc->encoding) return Qnil;
  return rb_str_new2((const char *)doc->encoding);
}

/*
 * call-seq:
 *  read_io(io, url, encoding, options)
 *
 * Create a new document from an IO object
 */
static VALUE read_io( VALUE klass,
                      VALUE io,
                      VALUE url,
                      VALUE encoding,
                      VALUE options )
{
  const char * c_url    = (url == Qnil) ? NULL : StringValuePtr(url);
  const char * c_enc    = (encoding == Qnil) ? NULL : StringValuePtr(encoding);

  xmlInitParser();

  xmlDocPtr doc = xmlReadIO(
      (xmlInputReadCallback)io_read_callback,
      (xmlInputCloseCallback)io_close_callback,
      (void *)io,
      c_url,
      c_enc,
      NUM2INT(options)
  );

  if(doc == NULL) {
    xmlFreeDoc(doc);
    rb_raise(rb_eRuntimeError, "Couldn't create a document");
    return Qnil;
  }

  return Nokogiri_wrap_xml_document(klass, doc);
}

/*
 * call-seq:
 *  read_memory(string, url, encoding, options)
 *
 * Create a new document from a String
 */
static VALUE read_memory( VALUE klass,
                          VALUE string,
                          VALUE url,
                          VALUE encoding,
                          VALUE options )
{
  const char * c_buffer = StringValuePtr(string);
  const char * c_url    = (url == Qnil) ? NULL : StringValuePtr(url);
  const char * c_enc    = (encoding == Qnil) ? NULL : StringValuePtr(encoding);
  int len               = NUM2INT(rb_funcall(string, rb_intern("length"), 0));

  xmlInitParser();
  xmlDocPtr doc = xmlReadMemory(c_buffer, len, c_url, c_enc, NUM2INT(options));

  if(doc == NULL) {
    xmlFreeDoc(doc);
    rb_raise(rb_eRuntimeError, "Couldn't create a document");
    return Qnil;
  }

  return Nokogiri_wrap_xml_document(klass, doc);
}

/*
 * call-seq:
 *  dup
 *
 * Copy this Document.  An optional depth may be passed in, but it defaults
 * to a deep copy.  0 is a shallow copy, 1 is a deep copy.
 */
static VALUE duplicate_node(int argc, VALUE *argv, VALUE self)
{
  VALUE level;

  if(rb_scan_args(argc, argv, "01", &level) == 0)
    level = INT2NUM(1);

  xmlDocPtr doc, dup;
  Data_Get_Struct(self, xmlDoc, doc);

  dup = xmlCopyDoc(doc, NUM2INT(level));
  if(dup == NULL) return Qnil;

  return Nokogiri_wrap_xml_document(cNokogiriXmlDocument, dup);
}

/*
 * call-seq:
 *  new
 *
 * Create a new document
 */
static VALUE new(int argc, VALUE *argv, VALUE klass)
{
  VALUE version;
  if(rb_scan_args(argc, argv, "01", &version) == 0)
    version = rb_str_new2("1.0");

  xmlDocPtr doc = xmlNewDoc((xmlChar *)StringValuePtr(version));
  return Nokogiri_wrap_xml_document(klass, doc);
}

/*
 *  call-seq:
 *    substitute_entities=(boolean)
 *
 *  Set the global XML default for substitute entities.
 */
static VALUE substitute_entities_set(VALUE klass, VALUE value)
{
    xmlSubstituteEntitiesDefault(NUM2INT(value));
    return Qnil ;
}

/*
 *  call-seq:
 *    load_external_subsets=(boolean)
 *
 *  Set the global XML default for load external subsets.
 */
static VALUE load_external_subsets_set(VALUE klass, VALUE value)
{
    xmlLoadExtDtdDefaultValue = NUM2INT(value);
    return Qnil ;
}

VALUE cNokogiriXmlDocument ;
void init_xml_document()
{
  VALUE nokogiri = rb_define_module("Nokogiri");
  VALUE xml = rb_define_module_under(nokogiri, "XML");
  VALUE node = rb_define_class_under(xml, "Node", rb_cObject);

  /*
   * Nokogiri::XML::Document wraps an xml document.
   */
  VALUE klass = rb_define_class_under(xml, "Document", node);

  cNokogiriXmlDocument = klass;

  rb_define_singleton_method(klass, "read_memory", read_memory, 4);
  rb_define_singleton_method(klass, "read_io", read_io, 4);
  rb_define_singleton_method(klass, "new", new, -1);
  rb_define_singleton_method(klass, "substitute_entities=", substitute_entities_set, 1);
  rb_define_singleton_method(klass, "load_external_subsets=", load_external_subsets_set, 1);

  rb_define_method(klass, "root", root, 0);
  rb_define_method(klass, "root=", set_root, 1);
  rb_define_method(klass, "serialize", serialize, 0);
  rb_define_method(klass, "encoding", encoding, 0);
  rb_define_method(klass, "dup", duplicate_node, -1);
  rb_define_method(klass, "url", url, 0);
  rb_undef_method(klass, "parent");
}


/* this takes klass as a param because it's used for HtmlDocument, too. */
VALUE Nokogiri_wrap_xml_document(VALUE klass, xmlDocPtr doc)
{
  VALUE rb_doc = Qnil;

  rb_doc = Data_Wrap_Struct(klass ? klass : cNokogiriXmlDocument, 0, dealloc, doc) ;
  rb_iv_set(rb_doc, "@decorators", Qnil);
  doc->_private = (void *)rb_doc;

  return rb_doc ;
}
