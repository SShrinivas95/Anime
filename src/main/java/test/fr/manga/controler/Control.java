package test.fr.manga.controler;

import com.fasterxml.jackson.databind.ObjectMapper;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import test.fr.manga.bean.Anime;
import test.fr.manga.bean.AnimeList;
import test.fr.manga.bean.MainPicture;
import test.fr.manga.service.MangaService;
import test.fr.manga.bean.manga;


import java.io.IOException;
import java.util.List;


//@RestController
@Controller
public class Control {


    private final MangaService manganese;

    @Autowired
    public Control(MangaService test) {
        super();
        this.manganese = test;
    }

    @ModelAttribute("Mangaa")
    public manga getManga() {
        return new manga();
    }

    @GetMapping("/manga")
    public String showForm(Model model) {
        model.addAttribute("Mangaa", new manga()); // Le modele "Mangaa" ici permet de faire le lie avec le modele
                                                              // attribut dans le /manga

        return "stockagepage";
    }

//	@PostMapping("/manga")
//	// @ModelAttribute("Mangaa")
//	public manga createManga(@RequestBody manga Mangaa) { // on va utiliser le "Mangaa"
//		// recuperer dans le
//		// model.attribut et on va l'ajouter
//		mangaserv.addManga(Mangaa);
//		return "redirect:/affiche";
//		return mangaserv.addManga(Mangaa);

    @PostMapping("/manga")
    public String createManga(@ModelAttribute("Mangaa") manga Mangaa,Model model) throws IOException { // on va utiliser le "Mangaa"

        OkHttpClient client = new OkHttpClient();

        Request request = new Request.Builder()
                .url("https://animes5.p.rapidapi.com/?fields=main_picture%2Ctitle&q=" +Mangaa.getNom())

                .get()
                .addHeader("X-RapidAPI-Key", "7d03da8c6bmsh0048e85d8130b68p13e088jsn319b5aca362e")
                .addHeader("X-RapidAPI-Host", "animes5.p.rapidapi.com")
                .build();

        Response response = client.newCall(request).execute();



        String responseBody = response.body().string();

        ObjectMapper mapper = new ObjectMapper();
        AnimeList animeList = mapper.readValue(responseBody, AnimeList.class);
        Anime[] Animetest = animeList.getAnimes();


        if (Animetest != null ) {
            model.addAttribute("existe","non");
            Anime ani = Animetest[0];
            Mangaa.setTitre(ani.getTitle());
            MainPicture image = ani.getMainPicture();
            Mangaa.setLargeImg(image.getLarge());
            Mangaa.setMediumImg(image.getMedium());
            manganese.addManga(Mangaa);
        }else {


        }



        return "redirect:/affiche";
    }

    @GetMapping("/affiche")
    public String afficherPage(Model model) {
        List<manga> mangas = manganese.lire();
        model.addAttribute("mangas", mangas);

        return "affiche";
    }

    @GetMapping("/")
    public String home(){
        return "home";
    }

//	@DeleteMapping("/Supprimer")
//	public void Supprime(@RequestBody manga Mangaa) {
//		String nom = Mangaa.getNom();
//		String Editeur = Mangaa.getEditeur();
//		mangaserv.Supp(nom, Editeur);
//
//	}

    @PostMapping("/affiche")
    public String Supprime(@ModelAttribute("Mangaa") manga Mangaa) {
        String nom = Mangaa.getNom();
        String Editeur = Mangaa.getEditeur();
        manganese.Supp(nom, Editeur);
        return "redirect:/affiche";
    }

    @PostMapping("/Lu")
    public String Vu(@ModelAttribute("Mangaa") manga Mangaa) {
        String vu = Mangaa.getVu();
        int id = Mangaa.getId();
        manganese.Vu(id, vu);
        return "redirect:/affiche";
    }

}