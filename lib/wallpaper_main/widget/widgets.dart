import 'package:flutter/material.dart';
import 'package:wallpaper_app/wallpaper_main/models/wallpaper_model.dart';
import 'package:wallpaper_app/wallpaper_main/view/image_view.dart';

Widget wallPaperList(List<WallpaperModel> wallpaper,context)
{
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      childAspectRatio: 0.6,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      children: wallpaper.map((wallpaper)
      {
        return GridTile(
            child: Container(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ImageView(
                    imgUrl: wallpaper.src.portrait,
                  )));
                },
                child: Hero(
                  tag: wallpaper.src.portrait,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(wallpaper.src.portrait,
                    fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )
        );
      }).toList(),
    ),
  );
}