<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Cadastro de Livro</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center">
        <c:if test="${livro.id == null}">Cadastrar Novo Livro</c:if>
        <c:if test="${livro.id != null}">Editar Livro</c:if>
    </h1>

    <form action="/livros" method="post" class="card p-4 shadow-sm">
        <input type="hidden" name="id" value="${livro.id}"/>

        <div class="mb-3">
            <label class="form-label">Título</label>
            <input type="text" name="titulo" class="form-control" value="${livro.titulo}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Autor</label>
            <input type="text" name="autor" class="form-control" value="${livro.autor}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Ano de Publicação</label>
            <input type="number" name="anoPublicacao" class="form-control" value="${livro.anoPublicacao}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Gênero</label>
            <input type="text" name="genero" class="form-control" value="${livro.genero}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Sinopse</label>
            <textarea name="sinopse" class="form-control" rows="3">${livro.sinopse}</textarea>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary me-2">Salvar</button>
            <a href="/livros" class="btn btn-secondary">Cancelar</a>
        </div>
    </form>
</div>

</body>
</html>
