<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Resultado de Compra</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .result-box { 
            border: 1px solid #ddd; 
            padding: 20px; 
            max-width: 500px; 
            margin: auto; 
            background-color: #f9f9f9;
        }
        .data-row { margin-bottom: 10px; }
        .total { 
            font-weight: bold; 
            color: #006600;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <div class="result-box">
        <h2>Resumen de Compra</h2>
        
        <div class="data-row">
            <strong>Producto:</strong> 
            <span id="producto">${requestScope['compra.nombre']}</span>
        </div>
        
        <div class="data-row">
            <strong>Precio Unitario:</strong> 
            <span id="precio">
                <fmt:formatNumber value="${requestScope['compra.precio']}" 
                                type="currency" 
                                currencyCode="USD"/>
            </span>
        </div>
        
        <div class="data-row">
            <strong>Cantidad:</strong> 
            <span id="cantidad">${requestScope['compra.cantidad']}</span>
        </div>
        
        <div class="data-row total">
            <strong>Total a Pagar:</strong> 
            <span id="total">
                <fmt:formatNumber value="${requestScope['compra.total']}" 
                                type="currency" 
                                currencyCode="USD"/>
            </span>
        </div>
        
        <div style="margin-top: 20px;">
            <a href="index.jsp">Volver</a>
        </div>
    </div>
</body>
</html>