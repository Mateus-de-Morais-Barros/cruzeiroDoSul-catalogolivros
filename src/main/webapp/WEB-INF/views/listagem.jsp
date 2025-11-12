<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Catálogo de Livros</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center">📚 Catálogo de Livros</h1>

    <form class="d-flex mb-3" action="/livros/buscar" method="get">
        <input type="text" name="termo" class="form-control me-2" placeholder="Buscar por título ou autor">
        <button class="btn btn-primary" type="submit">Buscar</button>
    </form>

    <div class="mb-3 text-end">
        <a href="/livros/novo" class="btn btn-success">+ Novo Livro</a>
    </div>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>Título</th>
                <th>Autor</th>
                <th>Ano</th>
                <th>Gênero</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="livro" items="${livros}">
                <tr>
                    <td>${livro.titulo}</td>
                    <td>${livro.autor}</td>
                    <td>${livro.anoPublicacao}</td>
                    <td>${livro.genero}</td>
                    <td>
                        <a href="/livros/${livro.id}" class="btn btn-sm btn-info">Ver</a>
                        <a href="/livros/${livro.id}/editar" class="btn btn-sm btn-warning">Editar</a>
                        <a href="/livros/${livro.id}/excluir" class="btn btn-sm btn-danger"
                           onclick="return confirm('Tem certeza que deseja excluir este livro?')">Excluir</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
