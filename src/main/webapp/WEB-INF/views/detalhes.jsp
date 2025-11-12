<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Detalhes do Livro</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card p-4 shadow-sm">
        <h1 class="mb-3">${livro.titulo}</h1>
        <p><strong>Autor:</strong> ${livro.autor}</p>
        <p><strong>Ano:</strong> ${livro.anoPublicacao}</p>
        <p><strong>Gênero:</strong> ${livro.genero}</p>
        <p><strong>Sinopse:</strong></p>
        <p>${livro.sinopse}</p>

        <div class="mt-3">
            <a href="/livros/${livro.id}/editar" class="btn btn-warning me-2">Editar</a>
            <a href="/livros" class="btn btn-secondary">Voltar</a>
        </div>
    </div>
</div>

</body>
</html>
