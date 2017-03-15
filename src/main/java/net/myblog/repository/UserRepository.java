package net.myblog.repository;

import net.myblog.entity.User;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, String>{
	
	User findByUsername(String username);
	
}
