<%
  String message = (String)session.getAttribute("message");

    if(message != null){
    
//    out.println(message);
%>
<div class="alert alert-success alert-dismissible fade show">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong><%=
      message
      %></strong>
</div>    
<%    
    
    
    session.removeAttribute("message");
    }
%>