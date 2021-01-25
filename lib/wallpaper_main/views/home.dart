import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/wallpaper_main/models/categorie_model.dart';
import 'package:wallpaper_app/wallpaper_main/models/wallpaper_model.dart';
import 'package:wallpaper_app/wallpaper_main/views/categorie.dart';
import 'package:wallpaper_app/wallpaper_main/views/categories.dart';
import 'package:wallpaper_app/wallpaper_main/views/search.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/wallpaper_main/widget/widgets.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategorieModel> categories = new List();
  List<WallpaperModel> wallpapers = new List();
  TextEditingController searchController = TextEditingController();
  getRandomWallpapers() async{
    var response = await http.get('https://api.pexels.com/v1/curated?per_page=15&page=1',
        headers: {
          'Authorization' : apiKEY
        }
    );
    print(response.body.toString());
    Map<String,dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element){
        WallpaperModel wallpaperModel = new WallpaperModel();
        wallpaperModel = WallpaperModel.fromMap(element);
        wallpapers.add(wallpaperModel);
    });
    setState(() {

    });
  }
  @override
  void initState() {
    getRandomWallpapers();
    categories=getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[900],
        child: Column(
          children: <Widget>[
            SizedBox(height: 18,),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[700],
            borderRadius: BorderRadius.circular(30),
          ),
          margin: EdgeInsets.symmetric(horizontal: 24),
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                controller: searchController,
                  style: TextStyle(
                      color: Colors.white70
                  ),
                  cursorColor: Colors.black26,
                  decoration: InputDecoration(
                      hintText: "Search Wallpapers",
                      border: InputBorder.none
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    if (searchController.text != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Search(
                                    searchQuery: searchController.text,
                                  )
                          )
                      );
                    }},
                    child:Icon(Icons.search),
                  ),

            ],
          ),
        ),
            SizedBox(height: 16,),
            Container(
              height: 80,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24),
                itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context, index)
                  {
                    return CategoryTile(
                      title: categories[index].categorieName,
                      imgUrl: categories[index].imgUrl,
                    );
                  }
              ),
            ),
            SizedBox(height: 16,),
            wallPaperList(wallpapers,context)
           ]
        ),
      ),
    );
  }
}



class CategoryTile extends StatelessWidget {
  final String imgUrl;
  final String title;

  const CategoryTile({ @required Key key, this.imgUrl, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=> Categorie(
          categoryname: title.toLowerCase(),
        )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius:BorderRadius.circular(8) ,
              child: Image.network(imgUrl,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 50,
              width: 100,
              color: Colors.black26,
              alignment: Alignment.center,
              child: Text(title,
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w500,
                fontSize: 16
              ),),
            )
          ],
        ),
      ),
    );
  }
}
