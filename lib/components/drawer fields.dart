import 'package:flutter/material.dart';

class Drawer_Fields extends StatelessWidget {
  final String fieldname;
  final Icon icon;
  final Function press;

  const Drawer_Fields({Key key, this.fieldname, this.icon, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black,
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Row(
          children: [
            Text(fieldname,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),),
            SizedBox(width: 10,),
           icon,
          ],
        ),
      ),
    );
  }
}
