/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.53
 * Generated at: 2019-05-08 18:05:39 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WRResources.swagger;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("  <title>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${wrProjectName}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write(" API</title>\r\n");
      out.write("  <link rel=\"icon\" type=\"image/png\" href=\"WRResources/swagger/images/favicon-32x32.png\" sizes=\"32x32\" />\r\n");
      out.write("  <link rel=\"icon\" type=\"image/png\" href=\"WRResources/swagger/images/favicon-16x16.png\" sizes=\"16x16\" />\r\n");
      out.write("  <link href='WRResources/swagger/css/typography.css' media='screen' rel='stylesheet' type='text/css'/>\r\n");
      out.write("  <link href='WRResources/swagger/css/reset.css' media='screen' rel='stylesheet' type='text/css'/>\r\n");
      out.write("  <link href='WRResources/swagger/css/screen.css' media='screen' rel='stylesheet' type='text/css'/>\r\n");
      out.write("  <link href='WRResources/swagger/css/reset.css' media='print' rel='stylesheet' type='text/css'/>\r\n");
      out.write("  <link href='WRResources/swagger/css/print.css' media='print' rel='stylesheet' type='text/css'/>\r\n");
      out.write("  <script src='WRResources/swagger/lib/jquery-1.8.0.min.js' type='text/javascript'></script>\r\n");
      out.write("  <script src='WRResources/swagger/lib/jquery.slideto.min.js' type='text/javascript'></script>\r\n");
      out.write("  <script src='WRResources/swagger/lib/jquery.wiggle.min.js' type='text/javascript'></script>\r\n");
      out.write("  <script src='WRResources/swagger/lib/jquery.ba-bbq.min.js' type='text/javascript'></script>\r\n");
      out.write("  <script src='WRResources/swagger/lib/handlebars-2.0.0.js' type='text/javascript'></script>\r\n");
      out.write("  <script src='WRResources/swagger/lib/underscore-min.js' type='text/javascript'></script>\r\n");
      out.write("  <script src='WRResources/swagger/lib/backbone-min.js' type='text/javascript'></script>\r\n");
      out.write("  <script src='WRResources/swagger/swagger-ui.js' type='text/javascript'></script>\r\n");
      out.write("  <script src='WRResources/swagger/lib/highlight.7.3.pack.js' type='text/javascript'></script>\r\n");
      out.write("  <script src='WRResources/swagger/lib/marked.js' type='text/javascript'></script>\r\n");
      out.write("  <script src='WRResources/swagger/lib/swagger-oauth.js' type='text/javascript'></script>\r\n");
      out.write("\r\n");
      out.write("  <script type=\"text/javascript\">\r\n");
      out.write("    $(function () {\r\n");
      out.write("      var url = window.location.search.match(/url=([^&]+)/);\r\n");
      out.write("      if (url && url.length > 1) {\r\n");
      out.write("        url = decodeURIComponent(url[1]);\r\n");
      out.write("      } else {\r\n");
      out.write("        url = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${wrBaseURI}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/api-docs.do\";\r\n");
      out.write("      }\r\n");
      out.write("      window.swaggerUi = new SwaggerUi({\r\n");
      out.write("        url: url,\r\n");
      out.write("        dom_id: \"swagger-ui-container\",\r\n");
      out.write("        supportedSubmitMethods: ['get', 'post', 'put', 'delete', 'patch'],\r\n");
      out.write("        onComplete: function(swaggerApi, swaggerUi){\r\n");
      out.write("          if(typeof initOAuth == \"function\") {\r\n");
      out.write("            initOAuth({\r\n");
      out.write("              clientId: \"your-client-id\",\r\n");
      out.write("              realm: \"your-realms\",\r\n");
      out.write("              appName: \"your-app-name\"\r\n");
      out.write("            });\r\n");
      out.write("          }\r\n");
      out.write("\r\n");
      out.write("          $('pre code').each(function(i, e) {\r\n");
      out.write("            hljs.highlightBlock(e)\r\n");
      out.write("          });\r\n");
      out.write("        },\r\n");
      out.write("        onFailure: function(data) {\r\n");
      out.write("          log(\"Unable to Load SwaggerUI\");\r\n");
      out.write("        },\r\n");
      out.write("        docExpansion: \"none\",\r\n");
      out.write("        apisSorter: \"alpha\",\r\n");
      out.write("        showRequestHeaders: false\r\n");
      out.write("      });\r\n");
      out.write("      window.swaggerUi.load();   \r\n");
      out.write("  });\r\n");
      out.write("  </script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"swagger-section\">\r\n");
      out.write("<div id=\"message-bar\" class=\"swagger-ui-wrap\">&nbsp;</div>\r\n");
      out.write("<div class=\"swagger-ui-wrap\"><ul id=\"resources\"><li class=\"resource\"><div class=\"heading\"><h1 style=\"font-size:200%\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${wrProjectName}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write(" API</h1></div></li></ul></div>\r\n");
      out.write("<div class=\"swagger-ui-wrap\"><ul id=\"resources\"><li class=\"resource\"><div class=\"heading\"><h4 style=\"font-size:150%;padding:2px\">This is the Web representation of the ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${wrProjectName}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write(" API.</h4></div></li></ul></div>\r\n");
      out.write("<div id=\"swagger-ui-container\" class=\"swagger-ui-wrap\"></div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
