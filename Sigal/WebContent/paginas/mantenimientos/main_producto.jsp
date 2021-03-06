<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib   prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib   prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="s"  uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">

$(document).ready(function() { 
	var vall = $("#totalPaginacion").val(); 
	$.post("paginacion",{cant:vall},function(data){
// 		alert(data);
		$("#paginacionAbajo").html(data);
	});
	
	
	 setTimeout(function(){ $('.alert').hide(1000); }, 3000); 
}); 
</script>
</head>
<body>

<c:if test="${requestScope.cant!=null}"   >
<input id="totalPaginacion" name="totalPaginacion"  type="hidden"  value="${ requestScope.cant}"  />
</c:if>


<h3>Mantenimiento Producto</h3>
<c:if test="${requestScope.rsult!=null}"   >
<c:if test="${requestScope.rsult=='0'}"   >
	<div class="alert alert-success"> 
	<h4>Bien!</h4>
	${requestScope.mensaje}
	</div> 
</c:if>
<c:if test="${requestScope.rsult=='1'}"   >
	<div class="alert alert-error"> 
	<h4>Error!</h4>
	${requestScope.mensaje}
	</div> 
</c:if>

</c:if>
	<form class="form-search"  action="buscarProductosXDescProd" method="post">
	    <input type="text" name="objProducto.desc_producto" class="input-medium search-query" placeholder="Producto" >
	    <button type="submit" class="btn">Buscar</button>
    </form>
    
     
				
    <table class="table table-striped table-bordered table-hover">
              <thead>
                <tr> 
                  <th>Producto</th>
                  <th>Categoria</th>
                  <th>Marca</th>
                  <th>U.Medida</th> 
                  <th>Modificar</th>
                  <th>Eliminar</th>
                </tr>
              </thead>
              <tbody>
              <c:if test="${requestScope.lstProducto!=null}"   >
			     <c:forEach  items="${requestScope.lstProducto}"  var="row"  >
			     	<tr> 
	                  <td>${row.desc_producto}</td>
	                  <td>${row.categoria}</td>
	                  <td>${row.marca}</td>
	                  <td>${row.unidadMedida}</td> 
	                  <td><a href="accionProducto?id=2&codProd=${row.cod_producto}">[Modificar]</a></td>
	                  <td><a href="eliminarProducto?id=0&codProd=${row.cod_producto}">[Eliminar]</a></td>
	                </tr>
			     </c:forEach> 
		      </c:if> 
              </tbody>
            </table>
            <s:hidden  name="bloqueAnterior"  value="0"    />
            <s:hidden  name="bloqueSiguiente" value="1"    />
            <div id="paginacionAbajo"> 
            
            </div>
<!--                 <div class="pagination"> -->
<!-- 			    <ul> -->
<!-- 			    <li><a href="#">Anterior</a></li> -->
<!-- 			    <li><a href="#">1</a></li> -->
<!-- 			    <li><a href="#">2</a></li> -->
<!-- 			    <li><a href="#">3</a></li> -->
<!-- 			    <li><a href="#">4</a></li> -->
<!-- 			    <li><a href="#">5</a></li> -->
<!-- 			    <li><a href="#">Siguiente</a></li> -->
<!-- 			    </ul> -->
<!-- 			    </div> -->
            <a class="btn btn-primary"  href="accionProducto?id=1">Nuevo Producto</a>
<!--             <a class="btn btn-primary"  href="productoStocks">Producto con Stocks</a> -->

</body>
</html>