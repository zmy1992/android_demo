import 'package:flutter/material.dart';
import 'package:flutter_demo/interaction_model_widgets/SecondPage.dart';

void main() {
  runApp(new MyNavigatorAppDemo());
}

class MyNavigatorAppDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "MyNavigatorAppDemo",
      theme: new ThemeData(primaryColor: Colors.red),
      routes: <String, WidgetBuilder>{
        "/secondpage": (BuildContext context) {
          return new SecondPageDemo();
        }
      },
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("NavigatorDemo"),
        ),
        body: new NavigatorDemo(),
      ),
    );
  }
}

class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new InkWell(
          child: new Text("From"),
          onTap: () {
            var route =
                new MaterialPageRoute<String>(builder: (BuildContext context) {
              return new SecondPageDemo(
                fromValue: "Back To First",
              );
            });
            Future<String> back = Navigator.of(context).push(route);
            back.then((String onValue) {
              print(onValue);
            });
          },
        ),
        new InkWell(
          child: new Text("From2"),
          onTap: () {
            Future<dynamic> back =
                Navigator.of(context).pushNamed("/secondpage");
            back.then((dynamic onValue) {
              print(onValue);
            });
          },
        )
      ],
    );
  }
}
