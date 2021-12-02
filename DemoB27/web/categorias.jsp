<%-- 
    Document   : categorias
    Created on : 8/11/2021, 08:13:47 PM
    Author     : fido
--%>

<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <title>Categorias</title>
        <!--<style>div{border: dotted;}</style>-->
    </head>
    <body>
        <%
            Usuario u = (Usuario) session.getAttribute("usr");
            if (u != null) {
        %>
        <jsp:include page="menu.jsp"/>

        <div class="container-fluid" ng-app="categorias" ng-controller="categoriasController as cat">
            <div class="row mt-2">
                <div class="col-10"><h2>Bienvenido/a: <%=u.getNombreDeUsuario()%></h2></div>
                <div class="col-2"><button type="button" class="btn btn-outline-danger btn-block" ng-click="cat.cerrarSesion()">Cerrar Sesión</button></div>
            </div>
            <div class="row">
                <!--seccion 1-->
                <div class="col-6">
                    <div class="row">
                        <div class="col-6">
                            <label>Id</label>
                            <input type="number" class="form-control" ng-model="cat.id">
                        </div>
                        <div class="col-6">
                            <label>Nombre</label>
                            <input type="text" class="form-control" ng-model="cat.nombre">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>Descrpicion</label>
                            <textarea class="form-control" ng-model="cat.descripcion"></textarea>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-3">
                            <button type="button" class="btn btn-success" ng-click="cat.guardar()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-primary" ng-click="cat.listar()">Listar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-warning" ng-click="cat.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modalEliminar">Eliminar</button>
                        </div>
                    </div>
                </div>
                <!--seccion 2-->
                <div class="col-6">
                    <div class="row">
                        <div class="col-6">
                            <label>Id</label>
                            <input type="text" disabled="" class="form-control" value="{{cat.id}}">
                        </div>
                        <div class="col-6">
                            <label>Nombre</label>
                            <input type="text" disabled="" class="form-control" value="{{cat.nombre}}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>Descripcion</label>
                            <textarea class="form-control" disabled="">{{cat.descripcion}}</textarea>
                        </div>
                    </div>
                </div>
            </div>
            <!--seccion 3-->
            <div class="row mt-2">
                <div class="col-12">
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Descripcion</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="c in cat.Categorias">
                                <td>{{c.id}}</td>
                                <td>{{c.nombre}}</td>
                                <td>{{c.descripcion}}</td>
                                <td>
                                    <button type="button" class="btn btn-info" ng-click="cat.editar(c.id)">Editar</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- Modal Eliminar-->
            <div class="modal fade" id="modalEliminar" tabindex="-1" aria-labelledby="eliminarModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="eliminarModalLabel">¿Está seguro de eliminar este registro?</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            El registro será eliminado completamente de la base de datos
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="cat.eliminar()">Si</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var app = angular.module('categorias', []);
            app.controller('categoriasController', ['$http', controladorCategorias]);
            function controladorCategorias($http) {
                var cat = this;
                validar = function (tipoDeValidacion) {
                    var id = cat.id ? true : false;
                    var nombre = cat.nombre ? true : false;
                    var descripcion = cat.descripcion ? true : false;
                    if (tipoDeValidacion === 'todosLosCampos') {
                        if (id && nombre && descripcion) {
                            return true;
                        } else {
                            return false;
                        }
                    } else if (tipoDeValidacion === 'nombreDescripcion') {
                        if (nombre && descripcion) {
                            return true;
                        } else {
                            return false;
                        }
                    } else if (tipoDeValidacion === 'soloId') {
                        if (id) {
                            return true;
                        } else {
                            return false;
                        }
                    } else {
                        return false;
                    }
                };
                cat.listar = function () {
                    var parametros = {
                        proceso: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCategoria.jsp',
                        params: parametros
                    }).then(function (res) {
                        cat.Categorias = res.data.Categorias;
                    });
                };
                cat.editar = function (idC) {
                    var parametros = {
                        proceso: 'consultarIndividual',
                        id: idC
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCategoria.jsp',
                        params: parametros
                    }).then(function (res) {
                        cat.id = res.data.Categoria.id;
                        cat.nombre = res.data.Categoria.nombre;
                        cat.descripcion = res.data.Categoria.descripcion;
                    });
                };
                cat.guardar = function () {
                    if (validar('nombreDescripcion')) {
                        var parametros = {
                            proceso: 'guardar',
                            nombre: cat.nombre,
                            descripcion: cat.descripcion
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesCategoria.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {
                                if (res.data.guardar === true) {
                                    swal({
                                        title: "Guardó",
                                        text: "El registro fue guardado exitosamente",
                                        icon: "success",
                                        button: "Cerrar"
                                    });
                                } else {
                                    swal({
                                        title: "No Guardó",
                                        text: "El registro no fue guardado exitosamente",
                                        icon: "error",
                                        button: "Cerrar"
                                    });
                                }
                            } else {
                                swal({
                                    title: "Falló",
                                    text: res.data.errorMsg,
                                    icon: "error",
                                    button: "Cerrar"
                                });
                            }
                        });
                    } else {
                        swal({
                            title: "Verificar campos",
                            text: "Los campos nombre y descripcion son obligatorios para guardar",
                            icon: "warning",
                            button: "Cerrar"
                        });
                    }
                };
                cat.actualizar = function () {
                    if (validar('todosLosCampos')) {
                        var parametros = {
                            proceso: 'actualizar',
                            id: cat.id,
                            nombre: cat.nombre,
                            descripcion: cat.descripcion
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesCategoria.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {
                                if (res.data.actualizar === true) {
                                    swal({
                                        title: "Ejecutó",
                                        text: "El registro fue actualizado exitosamente",
                                        icon: "success",
                                        button: "Cerrar"
                                    });
                                } else {
                                    swal({
                                        title: "No ejecutó",
                                        text: "El registro no fue actualizado exitosamente",
                                        icon: "error",
                                        button: "Cerrar"
                                    });
                                }
                            } else {
                                swal({
                                    title: "Falló",
                                    text: res.data.errorMsg,
                                    icon: "error",
                                    button: "Cerrar"
                                });
                            }
                        });
                    } else {
                        swal({
                            title: "Verificar campos",
                            text: "Para actualizar se requieren todos los campos",
                            icon: "warning",
                            button: "Cerrar"
                        });
                    }
                };
                cat.eliminar = function () {
                    if (validar('soloId')) {
                        var parametros = {
                            proceso: 'eliminar',
                            id: cat.id
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesCategoria.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {
                                if (res.data.eliminar === true) {
                                    swal({
                                        title: "Ejecutó",
                                        text: "El registro fue eliminado exitosamente",
                                        icon: "success",
                                        button: "Cerrar"
                                    });
                                } else {
                                    swal({
                                        title: "No ejecutó",
                                        text: "El registro no fue eliminado exitosamente",
                                        icon: "error",
                                        button: "Cerrar"
                                    });
                                }
                            } else {
                                swal({
                                    title: "Falló",
                                    text: res.data.errorMsg,
                                    icon: "error",
                                    button: "Cerrar"
                                });
                            }
                        });
                    } else {
                        swal({
                            title: "Verificar campos",
                            text: "Para eliminar se requiere el campo Id",
                            icon: "warning",
                            button: "Cerrar"
                        });
                    }

                };

                cat.cerrarSesion = function () {
                    var parametros = {
                        proceso: 'cerrarSesion'
                    };
                    $http({
                        method:'POST',
                        url:'peticionesLogin.jsp',
                        params:parametros
                    }).then(function (res) {
                        if(res.data.ok===true){
                            window.location.href="categorias.jsp";
                        }else{
                            alert(res.data.errorMsg);
                        }
                    });
                };

            }
        </script>
        <%} else {%>
    <center><a href="index.jsp">No se ha iniciado sesion o la sesión caducó, click acá para ingresar</a></center>
        <%}%>
</body>
</html>
