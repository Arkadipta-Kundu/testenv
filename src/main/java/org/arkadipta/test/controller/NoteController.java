package org.arkadipta.test.controller;

import org.arkadipta.test.entity.Note;
import org.arkadipta.test.repository.NoteRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/notes")
public class NoteController {
    private final NoteRepository repo;

    public NoteController(NoteRepository repo) {
        this.repo = repo;
    }

    @GetMapping
    public List<Note> getAllNotes() {
        return repo.findAll();
    }

    @PostMapping
    public Note createNote(@RequestBody Note note) {
        return repo.save(note);
    }
}
