import 'package:flutter/material.dart';

class FoodTile extends StatefulWidget {
  String image_name;
  String image_add;
  Function meth;
  double h1;
  FoodTile(this.image_add, this.image_name, this.meth(bool v), this.h1);

  @override
  _FoodTileState createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  bool showvalue = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: this.showvalue,
                  onChanged: (bool value) {
                    widget.meth(value);

                    setState(() {
                      this.showvalue = value;
                    });
                  },
                ),
                Text(
                  widget.image_name,
                  style: TextStyle(fontSize: widget.h1 / 20),
                ),
              ],
            ),
            Image(image: AssetImage(widget.image_add)),
          ],
        ),
        height: widget.h1 / 2,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffba2529),
            style: BorderStyle.solid,
            width: 1.0,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
