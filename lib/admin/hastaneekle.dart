import 'package:flutter/material.dart';

import '../sayfalar/kayitol.dart';

class HastaData {
  String hastaneAdi = '';
}

class HastaneEkle extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // ...
      title: '4 EVER 1',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: new MyHomePage(title: '4 EVER 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    HastaData hasta = HastaData();
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          "4 EVER 1",
          style: TextStyle(fontSize: 40),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.all(40.0),
                child: new Form(
                  autovalidate: true,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                          hintText: "Hastane Adını Giriniz.",
                          labelText: "Hastane Adı",
                        ),
                        keyboardType: TextInputType.text,
                        onSaved: (String) {
                          hasta.hastaneAdi;
                        },
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          hintText: "Bulunduğu şehri giriniz.",
                          labelText: "Şehir",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                      ),
                      new MaterialButton(
                        height: 50.0,
                        minWidth: 150.0,
                        color: Colors.green,
                        splashColor: Colors.teal,
                        textColor: Colors.white,
                        child: new Text("Hastane Ekle"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
