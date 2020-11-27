import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_restaurant/models/food_item.dart';

class FoodDetailPage extends StatefulWidget {
  final FoodItem foodItem;

  FoodDetailPage({@required this.foodItem}) {
    print('111');
    print(foodItem.name);
  }

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Restaurant - Food detail'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(
                width: 360.0,
                height: 240.0,
                fit: BoxFit.cover,
                image: NetworkImage(widget.foodItem.image),
              ),
              Text(
                '${widget.foodItem.name} ราคา ${widget.foodItem.price} ฿',
                style: GoogleFonts.lato(fontSize: 24.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
