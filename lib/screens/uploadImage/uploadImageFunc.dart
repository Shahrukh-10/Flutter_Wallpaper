import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';


Future pickAndUploadImage()async{
  File _image;
  PickedFile image = await ImagePicker().getImage(source: ImageSource.gallery,imageQuality: 50);
  _image=File(image.path);
  String imageName = basename(image.path);
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  firebase_storage.Reference reference = storage.ref().child('Images/$imageName');
  await reference.putFile(_image);
}
