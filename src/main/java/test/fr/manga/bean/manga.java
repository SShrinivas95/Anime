package test.fr.manga.bean;
//package test.fr.manga.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

@Entity
@Table(name = "Manga")
@Data
public class manga {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "nom")
    private String Nom;

    @Column(name = "editeur")
    private String Editeur;

    @Column(name = "vu")
    private String vu;

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    @Column(name = "title")
    private String titre;

    public String getLargeImg() {
        return LargeImg;
    }

    public void setLargeImg(String largeImg) {
        LargeImg = largeImg;
    }

    public String getMediumImg() {
        return MediumImg;
    }

    public void setMediumImg(String mediumImg) {
        MediumImg = mediumImg;
    }

    private String LargeImg ;

    private String MediumImg ;

    public String getEditeur() {
        return Editeur;
    }

    public void setEditeur(String editeur) {
        Editeur = editeur;
    }

    public String getVu() {
        return vu;
    }

    public void setVu(String vu) {
        this.vu = vu;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return Nom;
    }

    public void setNom(String nom) {
        Nom = nom;
    }

    public manga(int id, String nom, String editeur, String vu) {
        this.id = id;
        Nom = nom;
        Editeur = editeur;
        this.vu = vu;
    }

    public manga() {

    }


}