import 'package:flutter/material.dart';

class FoodListPage extends StatefulWidget {
  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  List<String> _foodList = ['ข้าวมันไก่', 'ข้าวขาหมู', 'ข้าวหมูแดง'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Restaurant - Food list'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _foodList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4.0,
              margin: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Image(
                    width: 80,
                    height: 80,
                    image: AssetImage('asset/images/ic_flutter.png'),
                  ),
                  Text(
                    _foodList[index],
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
