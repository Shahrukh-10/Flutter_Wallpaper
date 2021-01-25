import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: size.width*0.5,
            child: Image.asset(
                    'assets/images/bg.png'
                ),

            ),
        ],
      ),
    );
  }
}
