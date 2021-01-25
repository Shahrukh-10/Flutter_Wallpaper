import 'package:wallpaper_app/wallpaper_main/models/categorie_model.dart';

String apiKEY = '563492ad6f9170000100000173390d9e064c42eda14c3ff5664fbce4';

  List<CategorieModel> getCategories() {
    List<CategorieModel> categories = new List();
    ////////////////////////////////////////////
    CategorieModel categorieModel = new CategorieModel();

    categorieModel.imgUrl = 'https://images.pexels.com/photos/414860/pexels-photo-414860.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260';
    categorieModel.categorieName = "Future";
    categories.add(categorieModel);
    categorieModel = new CategorieModel();
    ///////////////////////////////////////////

    categorieModel.imgUrl = 'https://images.pexels.com/photos/47730/the-ball-stadion-football-the-pitch-47730.jpeg?auto=compress&cs=tinysrgb&h=650&w=940';
    categorieModel.categorieName = "Soccer";
    categories.add(categorieModel);
    categorieModel = new CategorieModel();
    ///////////////////////////////////////////

    categorieModel.imgUrl = 'https://images.pexels.com/photos/270085/pexels-photo-270085.jpeg?auto=compress&cs=tinysrgb&h=650&w=940';
    categorieModel.categorieName = "Barcelona";
    categories.add(categorieModel);
    categorieModel = new CategorieModel();
    ///////////////////////////////////////////

    categorieModel.imgUrl = 'https://images.pexels.com/photos/1580625/pexels-photo-1580625.jpeg?auto=compress&cs=tinysrgb&h=650&w=940';
    categorieModel.categorieName = "Dark";
    categories.add(categorieModel);
    categorieModel = new CategorieModel();
    ///////////////////////////////////////////

    categorieModel.imgUrl = 'https://images.pexels.com/photos/3165335/pexels-photo-3165335.jpeg?auto=compress&cs=tinysrgb&h=650&w=940';
    categorieModel.categorieName = "Gaming";
    categories.add(categorieModel);
    categorieModel = new CategorieModel();
    ///////////////////////////////////////////

    categorieModel.imgUrl = 'https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=650&w=940';
    categorieModel.categorieName = "Nature";
    categories.add(categorieModel);
    categorieModel = new CategorieModel();
    ///////////////////////////////////////////

    categorieModel.imgUrl = 'https://images.pexels.com/photos/567540/pexels-photo-567540.jpeg?auto=compress&cs=tinysrgb&h=650&w=940';
    categorieModel.categorieName = "Animals";
    categories.add(categorieModel);
    categorieModel = new CategorieModel();
    ///////////////////////////////////////////

    return categories;
  }