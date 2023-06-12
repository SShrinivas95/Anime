package test.fr.manga.repository;
//package test.fr.manga.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import test.fr.manga.bean.manga;

public interface MangaDAO extends JpaRepository <manga, Integer> {

}
