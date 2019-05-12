import 'package:flutter/material.dart';

void main() => runApp(new KayitOl());

class HastaData {
  String tc = '';
  String sifre = '';
  String adi = '';
  String soyadi = '';
  String cinsiyet = '';
  String telefon = '';
  String email = '';
  String dogumtarih = '';
}

class KayitOl extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // ...
      title: '4 EVER 1',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
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
  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }
  
  static const List<String> cinsiyet = const [
    'Cinsiyet',
    'Erkek',
    'Kadın',
    'Diğer',
  ];


String spinValue=cinsiyet[0]; 

//
//sadasda
//

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
                          hintText: "Adınızı Giriniz.",
                          labelText: "İsim",
                        ),
                        keyboardType: TextInputType.text,
                        onSaved: (String value) {hasta.adi=value;},
                      ),

                      new Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          hintText: "Soy Adınızı Giriniz.",
                          labelText: "Soy İsim",
                        ),
                        keyboardType: TextInputType.text,
                        onSaved: (String value) {hasta.soyadi=value;},
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                            hintText: "TC No Giriniz.",
                            labelText: "T.C Kimlik",
                            fillColor: Colors.white),
                        keyboardType: TextInputType.text,
                        onSaved: (String value) {hasta.tc=value;},
                      ),
                                            new Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),
                          new DropdownButton(   
                            isExpanded: true,
                            style: TextStyle(color:Colors.grey, fontSize: 18),
                            iconSize: 30,
                            value: spinValue,
                            onChanged: (string) => setState(() => spinValue = string),
                            items: cinsiyet.map((string) {
                              return new DropdownMenuItem(
                                child: new Text(string),
                                value: string,
                                
                              );
                              
                            }).toList(),
                          ),

                       new Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          hintText: "Şifrenizi Giriniz",
                          labelText: "Şifre",
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        onSaved: (String value) {hasta.sifre=value;},
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          hintText: "GG/AA/YY",
                          labelText: "Doğum Tarihi",
                        ),
                        keyboardType: TextInputType.datetime,
                        onSaved: (String value) {hasta.dogumtarih=value;},
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          hintText: "Telefon",
                          labelText: "Telefon",
                        ),
                        keyboardType: TextInputType.text,
                        onSaved: (String value) {hasta.telefon=value;},
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          hintText: "Email",
                          labelText: "Email",
                        ),
                        keyboardType: TextInputType.text,
                        onSaved: (String value) {hasta.email=value;},
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                      ),
                      new MaterialButton(
                        height: 50.0,
                        minWidth: 150.0,
                        color: Colors.red,
                        splashColor: Colors.teal,
                        textColor: Colors.white,
                        child: new Text("Kayıt Ol"),
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
