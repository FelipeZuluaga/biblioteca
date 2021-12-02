<%-- 
    Document   : consultarLibros
    Created on : 12/11/2021, 08:14:43 PM
    Author     : fido
--%>

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
        <title>Consultar libros</title>
        <!--<style>div{border: dotted;}</style>-->
    </head>
    <body>
        <jsp:include page="menuPublico.jsp"/>
        <div class="container-fluid" ng-app="consultarLibros" ng-controller="consultarLibrosController as cl">
            <div class="row">
                <div class="col-2">
                    ISBN:<input type="checkbox" class="form-control" ng-model="cl.bIsbn" ng-init="cl.bIsbn = false">
                </div>
                <div class="col-2">
                    Nombre:<input type="checkbox" class="form-control" ng-model="cl.bNombre" ng-init="cl.bNombre = false">
                </div>
                <div class="col-2">
                    Año:<input type="checkbox" class="form-control" ng-model="cl.bAnnio" ng-init="cl.bAnnio = false">
                </div>
                <div class="col-2">
                    Autor:<input type="checkbox" class="form-control" ng-model="cl.bAutor" ng-init="cl.bAutor = false">
                </div>
                <div class="col-2">
                    Categoria:<input type="checkbox" class="form-control" ng-model="cl.bCategoria" ng-init="cl.bCategoria = false">
                </div>
            </div>
            <div class="row">
                <div class="col-6" ng-if="cl.bIsbn">
                    Buscador ISBN
                    <input type="text" class="form-control" ng-model="cl.isbn">
                    <button type="button" class="btn btn-info mt-2" ng-click="cl.consultarPorIsbn()">Consultar</button>
                </div>
                <div class="col-6" ng-if="cl.bNombre">
                    Buscador nombre
                    <input type="text" class="form-control" ng-model="cl.nombre">
                    <button type="button" class="btn btn-info mt-2" ng-click="cl.consultarPorNombre()">Consultar</button>
                </div>
            </div>
            <div class="row">
                <div class="col-6" ng-if="cl.bAnnio">
                    Buscador año
                    <input type="number" class="form-control" ng-model="cl.annio">
                    <button type="button" class="btn btn-info mt-2" ng-click="cl.consultarPorAnnio()">Consultar</button>
                </div>
                <div class="col-6" ng-if="cl.bAutor">
                    Buscador Autor
                    <input type="text" class="form-control" ng-model="cl.autor">
                    <button type="button" class="btn btn-info mt-2" ng-click="cl.consultarPorAutor()">Consultar</button>
                </div>
            </div>
            <div class="row">
                <div class="col-6" ng-if="cl.bCategoria">
                    Buscador Categoria
                    <input type="text" class="form-control" ng-model="cl.categoria">
                    <button type="button" class="btn btn-info mt-2" ng-click="cl.consultarPorCategoria()">Consultar</button>
                </div>
            </div>
            <!--seccion 3-->
            <div class="row mt-2">
                <div class="col-12">
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">ISBN</th>
                                <th scope="col">Nombre</th>
                                <th scope="col"># de paginas</th>
                                <th scope="col">año</th>
                                <th scope="col">Autor</th>
                                <th scope="col">Categoria</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="l in cl.Libros">
                                <td>{{l.isbn}}</td>
                                <td>{{l.nombre}}</td>
                                <td>{{l.numeroDePaginas}}</td>
                                <td>{{l.annio}}</td>
                                <td>{{l.autor.nombre}}</td>
                                <td>{{l.categoria.nombre}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            var app = angular.module('consultarLibros', []);
            app.controller('consultarLibrosController', ['$http', controladorConsultarLibros]);
            function controladorConsultarLibros($http) {
                var cl = this;
                cl.consultarPorIsbn = function () {
                    var parametros = {
                        proceso: 'consultarIndividualIsbn',
                        isbn: cl.isbn
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesConsultasLibros.jsp',
                        params: parametros
                    }).then(function (res) {
                        cl.Libros=res.data.Libros;
                    });
                };
                
                cl.consultarPorNombre = function () {
                    var parametros = {
                        proceso: 'consultarIndividualNombre',
                        nombre: cl.nombre
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesConsultasLibros.jsp',
                        params: parametros
                    }).then(function (res) {
                        cl.Libros=res.data.Libros;
                    });
                };
                
                cl.consultarPorAnnio = function () {
                    var parametros = {
                        proceso: 'consultarIndividualAnnio',
                        annio: cl.annio
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesConsultasLibros.jsp',
                        params: parametros
                    }).then(function (res) {
                        cl.Libros=res.data.Libros;
                    });
                };
                
                 cl.consultarPorAutor = function () {
                    var parametros = {
                        proceso: 'consultarIndividualAutor',
                        autor: cl.autor
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesConsultasLibros.jsp',
                        params: parametros
                    }).then(function (res) {
                        cl.Libros=res.data.Libros;
                    });
                };

                cl.consultarPorCategoria = function () {
                    var parametros = {
                        proceso: 'consultarIndividualCategoria',
                        categoria: cl.categoria
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesConsultasLibros.jsp',
                        params: parametros
                    }).then(function (res) {
                        cl.Libros=res.data.Libros;
                    });
                };
            }

        </script>

    </body>
</html>
