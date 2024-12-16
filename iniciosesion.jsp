<%@ page import="base.*" session="false" %>
<%! conexion base = new conexion("localhost","cecydulces","root",""); %>
<%

    String usuario = request.getParameter("usuario");
    String password = request.getParameter("password");

    base.consultaSel("Select * from usuarios where usuario='"+usuario+"'");
    if(base.num_regs()>0){
        base.consultaSel("Select * from usuarios where usuario='"+usuario+
        "' and password=sha2('"+password+"',256)");
        if(base.num_regs()>0){
            HttpSession session = request.getSession(true);
            session.setMaxInactiveInterval(300);
            session.setAttribute("usuario",usuario);
            String id=base.getData(1);
            response.sendRedirect("index.html");
        }
        else{
            out.print("Contrase&ntilde;a incorrecta");
        }

    }
    else{
        out.print("Usuario incorrecto");
    }


%>