<%-- 
    Document   : index
    Created on : 27 may 2025, 7:13:39 p.m.
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compras de Productos</title>
        <style>
            .form-container {
                width: 50%;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ddd;
                background-color: #f5f5f5;
            }
            .error {
                color: red;
                font-weight: bold;
            }
            input[type="number"] {
                width: 100px;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h1>Compras de Productos</h1>
            
            <c:if test="${not empty mensajeError}">
                <p class="error">${mensajeError}</p>
            </c:if>
            
            <form action="procesarCompra" method="post">
                <div>
                    <label for="nombreProducto">Nombre del Producto:</label>
                    <input type="text" id="nombreProducto" name="nombreProducto" required>
                </div>
                <br>
                <div>
                    <label for="precio">Precio Unitario (USD):</label>
                    <input type="number" id="precio" name="precio" step="0.01" min="0.01" required>
                </div>
                <br>
                <div>
                    <label for="cantidad">Cantidad:</label>
                    <input type="number" id="cantidad" name="cantidad" min="1" required>
                </div>
                <br>
                <div>
                    <input type="submit" value="Calcular Total">
                </div>
            </form>
        </div>
    </body>
</html>
