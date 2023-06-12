package test.fr.manga.service;
//package test.fr.manga.service;
//
//import test.fr.manga.bean.manga;

import test.fr.manga.bean.manga;

import java.util.List;

public interface MangaService {
    manga addManga(manga Manga);

    List<manga> lire();

    void Supp(String nom, String editeur);

    void Vu (int id,String vu);
}
