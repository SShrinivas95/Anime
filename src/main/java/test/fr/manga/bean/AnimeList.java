package test.fr.manga.bean;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class AnimeList {
    private Anime[] animes;
    public Anime[] getAnimes() {
        return animes;
    }

    public void setAnimes(Anime[] animes) {
        this.animes = animes;
    }
}
