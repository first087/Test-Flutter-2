import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_restaurant/pages/food_list.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _inputPassword = '';

  _handleNumButtonClick(int number) {
    setState(() {
      _inputPassword += number.toString();

      if (_inputPassword.length < 4) return;

      if (_inputPassword != '1234') {
        Fluttertoast.showToast(
            msg: "Wrong password!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);

        _inputPassword = '';

        return;
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FoodListPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Restaurant - Login'),
      ),
      backgroundColor: Colors.green[200],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: SizedBox(
                width: 128.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    for (int i = 1; i <= 4; i++)
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: _inputPassword.length >= i
                              ? Colors.blue
                              : Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              ),
              // child: Text(
              //   _inputPassword.replaceAll(RegExp('\\d'), '*'),
              //   style: GoogleFonts.prompt(
              //     fontSize: 32,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ),
          ),
          Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 1; i <= 3; i++)
                        NumButton(i, _handleNumButtonClick),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 4; i <= 6; i++)
                        NumButton(i, _handleNumButtonClick),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 7; i <= 9; i++)
                        NumButton(i, _handleNumButtonClick),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      NumButton(0, _handleNumButtonClick),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NumButton extends StatelessWidget {
  final int number;
  final Function onClick;

  const NumButton(
    this.number,
    this.onClick, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.orangeAccent[100],
          border: Border.all(
            color: Colors.orange,
            width: 2.0,
          ),
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(40.0)
        ),
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                onClick(number);
              },
              borderRadius: BorderRadius.circular(40.0),
              child: Center(
                child: Text(
                  number.toString(),
                  style: GoogleFonts.prompt(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
