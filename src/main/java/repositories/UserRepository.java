package repositories;

import models.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends CrudRepository<User,Long> {
    List<User> findAll();
    //to look for email that already exists in DB
    Optional<User> findByEmail(String email);

}
