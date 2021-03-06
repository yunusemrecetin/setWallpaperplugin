import 'package:flutter/material.dart';
import 'package:wallpaper/wallpaper.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var result = "Waiting to set wallpaper";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: 300.0,
        height: 600.0,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                color: Colors.black,
                child: Text(
                  "Home Screen",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {
                  String res;
                  res = await Wallpaper.homeScreen(
                      "https://images.pexels.com/photos/2056609/pexels-photo-2056609.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500");
                  if (!mounted) return;
                  setState(() {
                    result = res.toString();
                  });
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  color: Colors.black,
                  child: Text(
                    "Lock Screen",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () async {
                    String res;
                    res = await Wallpaper.lockScreen(
                        "https://images.pexels.com/photos/2040612/pexels-photo-2040612.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500");
                    if (!mounted) return;
                    setState(() {
                      result = res.toString();
                    });
                  },
                )),
            Padding(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  color: Colors.black,
                  child: Text(
                    "Both",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () async {
                    String res;
                    res = await Wallpaper.bothScreen(
                        "https://images.pexels.com/photos/2049487/pexels-photo-2049487.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500");
                    if (!mounted) return;
                    setState(() {
                      result = res;
                    });
                  },
                )),
            Padding(padding: EdgeInsets.all(10), child: Text(result.toString()))
          ],
        ),
      )),
    );
  }
}
