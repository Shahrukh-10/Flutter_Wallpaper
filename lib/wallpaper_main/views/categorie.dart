import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/wallpaper_main/models/wallpaper_model.dart';
import 'package:wallpaper_app/wallpaper_main/widget/widgets.dart';

import 'categories.dart';

class Categorie extends StatefulWidget {
  final String categoryname;

  const Categorie({Key key, this.categoryname}) : super(key: key);
  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<WallpaperModel> wallpapers = new List();

  getSearchWallpapers(String query) async{
    var response = await http.get(  "https://api.pexels.com/v1/search?query=$query&per_page=20&page=1",
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
    getSearchWallpapers(widget.categoryname);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
        appBar:AppBar(
          backgroundColor: Colors.grey[800],
          elevation: 0.0,
          title: Row(
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              Text(
                "Wallpaper ",
                style: TextStyle(color: Colors.white, fontFamily: 'Overpass'),
              ),
              Text(
                "Wizard",
                style: TextStyle(color: Colors.blue, fontFamily: 'Overpass'),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 16,),
                wallPaperList(wallpapers,context),
              ],
            ),
          ),
        ),
      );
  }
}
