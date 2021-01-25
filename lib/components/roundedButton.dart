import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Function press;

  const RoundedButton({Key key, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.75,
      height: size.height*0.065,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.red[900],
        borderRadius: BorderRadius.circular(30),
      ),
      child: RaisedButton(
        elevation: 0,
        color: Colors.red[900],
        onPressed: press,
        child: Text(
          'Continue',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0
          ),
        ),
      ),
    );
  }
}
