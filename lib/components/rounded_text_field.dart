import 'package:flutter/material.dart';

class Rounded_text_field extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const Rounded_text_field({Key key, this.onChanged}) : super(key: key);

  @override
  _Rounded_text_fieldState createState() => _Rounded_text_fieldState();
}

class _Rounded_text_fieldState extends State<Rounded_text_field> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
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
        controller: _controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Your Email',
          hintStyle: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold
          ),
          icon: Icon(
            Icons.email,
            color:Colors.white70,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.cancel,
              color:Colors.white70,
            ),
            onPressed: (){
              setState(() {
                _controller.clear();
              });
            },
          ),
        ),
      ),
    );
  }
}
