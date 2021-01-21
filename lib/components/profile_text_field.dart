import 'package:flutter/material.dart';

class Profile_text_field extends StatelessWidget {
  final Icon icon;
  final String label;
  final ValueChanged<String> onChanged;

  const Profile_text_field({Key key, this.icon, this.label, this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        children: [
          Container(
            child: icon,
          ),
          Container(
            width: size.width*0.7,
            child: TextField(
              onChanged: onChanged,
              style: TextStyle(
                  color:Colors.white,
                  fontWeight: FontWeight.bold
              ),
              decoration: InputDecoration(
                hintText: label,
                fillColor: Colors.grey[900],
                filled: true,
                border: InputBorder.none,
                hintStyle: TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.bold
                ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
