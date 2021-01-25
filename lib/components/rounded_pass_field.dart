import 'package:flutter/material.dart';

class Rounded_pass_field extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const Rounded_pass_field({Key key, this.onChanged}) : super(key: key);

  @override
  _Rounded_pass_fieldState createState() => _Rounded_pass_fieldState();
}
bool obscuretext = true;
Icon iconOff = Icon(Icons.visibility_off,color: Colors.white,);
Icon iconOn = Icon(Icons.visibility,color: Colors.white,);

class _Rounded_pass_fieldState extends State<Rounded_pass_field> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.75,
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        onChanged: widget.onChanged,
        obscureText: obscuretext,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Your Password',
          hintStyle: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold
          ),
          icon: Icon(
            Icons.lock,
            color:Colors.white70,
          ),
          suffixIcon: IconButton(
            icon: obscuretext? iconOff:iconOn,
            onPressed: (){
              setState(() => obscuretext = !obscuretext,
              );
            },
          ),
        ),
      ),
    );
  }
}
