/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.comprasproductos;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/procesarCompra")
public class ProcesarCompraServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Configurar encoding y cabeceras anti-caché
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
        
        try {
            // Obtener parámetros
            String nombre = request.getParameter("nombreProducto");
            double precio = Double.parseDouble(request.getParameter("precio"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            
            // Validación
            if (cantidad < 0) {
                request.setAttribute("mensajeError", "La cantidad debe ser positiva");
                forwardToJsp(request, response, "index.jsp");
                return;
            }
            
            // Cálculos
            double total = precio * cantidad;
            
            // Establecer atributos con un prefijo único
            request.setAttribute("compra.nombre", nombre);
            request.setAttribute("compra.precio", precio);
            request.setAttribute("compra.cantidad", cantidad);
            request.setAttribute("compra.total", total);
            
            // Redirección
            forwardToJsp(request, response, "resultado.jsp");
            
        } catch (NumberFormatException e) {
            request.setAttribute("mensajeError", "Valores numéricos inválidos");
            forwardToJsp(request, response, "index.jsp");
        }
    }
    
    private void forwardToJsp(HttpServletRequest request, HttpServletResponse response, String jspPage)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);
    }
}