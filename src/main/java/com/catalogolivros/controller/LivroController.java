package com.catalogolivros.controller;

import com.catalogolivros.model.Livro;
import com.catalogolivros.repository.LivroRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/livros")
public class LivroController {

    private final LivroRepository livroRepository;

    public LivroController(LivroRepository livroRepository) {
        this.livroRepository = livroRepository;
    }

    @GetMapping
    public String listar(Model model) {
        model.addAttribute("livros", livroRepository.findAll());
        return "listagem";
    }

    @GetMapping("/novo")
    public String novo(Model model) {
        model.addAttribute("livro", new Livro());
        return "form";
    }

    @PostMapping
    public String salvar(@ModelAttribute Livro livro) {
        livroRepository.save(livro);
        return "redirect:/livros";
    }

    @GetMapping("/{id}")
    public String detalhes(@PathVariable Long id, Model model) {
        model.addAttribute("livro", livroRepository.findById(id).orElseThrow());
        return "detalhes";
    }

    @GetMapping("/{id}/editar")
    public String editar(@PathVariable Long id, Model model) {
        model.addAttribute("livro", livroRepository.findById(id).orElseThrow());
        return "form";
    }

    @GetMapping("/{id}/excluir")
    public String excluir(@PathVariable Long id) {
        livroRepository.deleteById(id);
        return "redirect:/livros";
    }

    @GetMapping("/buscar")
    public String buscar(@RequestParam String termo, Model model) {
        List<Livro> resultados = livroRepository.findByTituloContainingIgnoreCase(termo);
        resultados.addAll(livroRepository.findByAutorContainingIgnoreCase(termo));
        model.addAttribute("livros", resultados);
        return "listagem";
    }
}
