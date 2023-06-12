package test.fr.manga.service;
//package test.fr.manga.service;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import test.fr.manga.bean.manga;
import test.fr.manga.repository.MangaDAO;
import test.fr.manga.service.MangaService;
//import test.fr.manga.bean.manga;
//import test.fr.manga.repository.MangaDAO;


@Service
public class MangaServiceImple implements MangaService {


    private MangaDAO dao;

    @Autowired
    public MangaServiceImple(MangaDAO dao) {
        this.dao = dao;
    }

    public manga addManga(manga Manga) {
        return dao.save(Manga);
    }

    public List<manga> lire() {
        return dao.findAll();
    }

    @Override
    public void Supp(String nom, String editeur ) {
        String nomm = nom;
        String editeurr = editeur;
        List<manga> liste = dao.findAll();
        for (manga List : liste)
            if (nomm.equals(List.getNom()) && editeurr.equals(List.getEditeur())) {
                dao.deleteById(List.getId());
            }
    }

    @Override
    public void Vu(int id, String vu) {
        List<manga> liste = dao.findAll();
       for(manga manga5 : liste)
           if(manga5.getId()==id){
               manga5.setVu(vu);
               dao.save(manga5);
           }
    }
}