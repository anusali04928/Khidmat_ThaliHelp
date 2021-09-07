import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
//  const BottomBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 15,
      decoration: new BoxDecoration(
        boxShadow: [new BoxShadow(blurRadius: 10.0)],
        borderRadius: new BorderRadius.vertical(
            bottom: new Radius.elliptical(size.width, 100.0)),
      ),
      child: BottomAppBar(
        color: Colors.white,
        child: Row(),
      ),
    );
  }
}
