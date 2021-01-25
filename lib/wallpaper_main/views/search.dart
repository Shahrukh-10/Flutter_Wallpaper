import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wallpaper_app/wallpaper_main/models/wallpaper_model.dart';
import 'package:wallpaper_app/wallpaper_main/widget/widgets.dart';

import 'categories.dart';
class Search extends StatefulWidget {
  final String searchQuery;

  const Search({Key key, this.searchQuery}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}
TextEditingController searchController = TextEditingController();
List<WallpaperModel> wallpapers = new List();


class _SearchState extends State<Search> {
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
    getSearchWallpapers(widget.searchQuery);
    searchController.text=widget.searchQuery;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
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
                        getSearchWallpapers(searchController.text);
                        },
                      child:Icon(Icons.search),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 16,),
              wallPaperList(wallpapers,context)
            ],
          ),
        ),
      ),
    );
  }
}
