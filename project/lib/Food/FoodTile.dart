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
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Container(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SanFrancisco',
                      fontSize: widget.h1 / 20,
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 0.25,
                    ),
                  ),
                ],
              ),
              Divider(
                height: 0,
                color: Color(0xffba2529),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                child: Image(
                  // alignment: Alignment.center,
                  image: AssetImage(widget.image_add),
                  fit: BoxFit.fitHeight,
                  height: (widget.h1 / 4),
                  width: MediaQuery.of(context).size.width,
                ),
              )
            ],
          ),
          height: widget.h1 / 2,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xffba2529),
              style: BorderStyle.solid,
              width: 1.5,
            ),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
