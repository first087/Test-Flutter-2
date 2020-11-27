import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_restaurant/models/food_item.dart';
import 'package:my_restaurant/services/api.dart';

class FoodListPage extends StatefulWidget {
  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  List<String> _foodList = ['ข้าวมันไก่', 'ข้าวขาหมู', 'ข้าวหมูแดง'];

  Future<List<FoodItem>> _futureFoodList;

  @override
  void initState() {
    super.initState();

    fetchFoods();
  }

  void fetchFoods() {
    Api api = Api();

    _futureFoodList = api.fetchFoods();

    print(_futureFoodList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Restaurant - Food list'),
      ),
      body: Container(
        child: FutureBuilder<List<FoodItem>>(
          // initialData: [],
          future: _futureFoodList,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? _buildList(snapshot.data)
                : _buildLoading();
          },
        ),
      ),
    );
  }

  Widget _buildList(List<FoodItem> foodList) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: foodList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  elevation: 2.0,
                  child: InkWell(
                    onTap: () {
                      print(foodList[index].name);
                    },
                    child: Row(
                      children: <Widget>[
                        Image(
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.cover,
                          image: NetworkImage(foodList[index].image),
                        ),
                        Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            foodList[index].name,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
        // Container(
        //   color: Colors.green,
        //   height: 64,
        //   child: Center(
        //     child: Text('Total: 0'),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
