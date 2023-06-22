import 'package:flutter/material.dart';
class FonSize extends StatelessWidget {
  const FonSize({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double _fontSize = 16.0;
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Text Change with Slider"),
            centerTitle: true,
          ),
          body: Column(children: [
            Text(
              "JBtronic",
              style: TextStyle(
                fontSize: _fontSize,
              ),
            ),
            SizedBox(
              width: 270,
              child: Slider(
                value: _fontSize,
                activeColor: Colors.black,
                inactiveColor: Colors.grey,
                min: 10.0,
                max: 30.0,
                onChanged: (value){
                  setState(() {
                    _fontSize = value;
                  });
                },
              ),
            )
          ]),
        )
    );
  }


  void setState(Null Function() param0) {}
}
