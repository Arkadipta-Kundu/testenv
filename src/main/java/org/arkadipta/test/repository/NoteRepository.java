package org.arkadipta.test.repository;

import org.arkadipta.test.entity.Note;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface NoteRepository extends MongoRepository<Note, String> {
}
