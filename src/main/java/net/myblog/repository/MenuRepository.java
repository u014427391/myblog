package net.myblog.repository;

import java.util.List;
import java.util.Set;

import net.myblog.entity.Menu;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MenuRepository extends JpaRepository<Menu, Integer>{
	public List<Menu> findAll();
}
