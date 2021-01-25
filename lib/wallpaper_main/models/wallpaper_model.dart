import 'package:flutter/cupertino.dart';

class WallpaperModel{
  String photographer;
  String photographer_url;
  int photographer_id;
  SrcModel src;

  WallpaperModel({this.photographer,this.photographer_id,this.photographer_url,this.src});
  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData)
  {
    return WallpaperModel(
      src:SrcModel.forMap(jsonData['src']),
      photographer: jsonData['photographer'],
      photographer_url: jsonData['photographer_url'],
      photographer_id: jsonData['photographer_id'],

    );
  }
}
class SrcModel{
  String orignal;
  String small;
  String portrait;

  SrcModel({ this.orignal, this.small, this.portrait});
  factory SrcModel.forMap(Map<String,dynamic> jsonData)
  {
    return SrcModel(
      portrait: jsonData['portrait'],
      small:jsonData['small'],
      orignal:jsonData['orignal']
    );
  }
}