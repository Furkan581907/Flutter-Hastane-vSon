import 'package:flutter/material.dart';

import 'admin/hastaneekle.dart';
import 'bottombar.dart';
import 'bottomicon.dart';
import 'data.dart';
import 'layout.dart';
import 'sayfalar/anasayfa.dart';
import 'sayfalar/favoriler.dart';
import 'sayfalar/randevular.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Key keyanasayfa = PageStorageKey('pageAnaSayfa');
  final Key keyfavoriler = PageStorageKey('pageFavoriler');
  final Key keyrandevular = PageStorageKey('pageRandevular');

  int currentTab = 0;

  AnaSayfa anaSayfa;
  Favoriler favoriler;
  Randevular randevular;
  List<Widget> pages;
  Widget currentPage;

  List<Data> dataList;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    dataList = [
      Data(1, true, "Hastane Adı-1"),
      Data(2, false, "Hastane Adı-2"),
      Data(3, false, "Hastane Adı-3"),
      Data(4, true, "Hastane Adı-4"),
      Data(5, false, "Hastane Adı-5"),
      Data(6, false, "Hastane Adı-6"),
      Data(7, false, "Hastane Adı-7"),
      Data(8, false, "Hastane Adı-8"),
      Data(9, false, "Hastane Adı-9"),
      Data(10, false, "Hastane Adı-10"),
    ];
    anaSayfa = AnaSayfa(
      key: keyanasayfa,
      dataList: dataList,
    );
    favoriler = Favoriler(
      key: keyfavoriler,
    );
    randevular = Randevular(
      key: keyrandevular,
    );

    pages = [anaSayfa, favoriler,randevular];

    currentPage = anaSayfa;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("4 EVER 1"),
      ),
      drawer: new Drawer(
        child: new ListView(children: <Widget>[
          new ListTile(
            title: new Text(
              "4 EVER 1",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            subtitle: Text('BETA'),
          ),
          Divider(),
          new ListTile(
              title: new Text("Hastane Ekle"),
              trailing: new Icon(Icons.local_hospital),
              onTap: () {
                Navigator.of(context).pop;
                Navigator.of(context).push(new MaterialPageRoute(
                  builder:(BuildContext context)=>HastaneEkle()));
              }),
          new ListTile(
            title: new Text("Hastane Listele"),
            trailing: new Icon(Icons.list),
            onTap: () {},
          ),
          Divider(),
          new ListTile(
            title: new Text("Poliklinik Ekle"),
            trailing: new Icon(Icons.add_circle),
          ),
          new ListTile(
            title: new Text("Poliklinik Listele"),
            trailing: new Icon(Icons.list),
          ),
          Divider(),
          new ListTile(
            title: new Text("Doktor Ekle"),
            trailing: new Icon(Icons.add_to_queue),
          ),
          new ListTile(
            title: new Text("Doktor Listele"),
            trailing: new Icon(Icons.list),
          ),
          Divider(),
          new ListTile(
            title: new Text("Doktor İzni Ekle"),
            trailing: new Icon(Icons.add_comment),
          ),
          new ListTile(
            title: new Text("Doktor İzni Listele"),
            trailing: new Icon(Icons.view_list),
          ),
          Divider(),
          new ListTile(
            title: new Text("HAKKINDA"),
            trailing: new Icon(Icons.help),
          ),
        ]),
      ),
      body: PageStorage(
        child: currentPage,
        bucket: bucket,
      ),
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.grey,
        selectedColor: Colors.purple,
        onTabSelected: (int index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Ana Sayfa'),
          FABBottomAppBarItem(iconData: Icons.favorite, text: 'Favoriler'),
          FABBottomAppBarItem(iconData: Icons.date_range, text: 'Randevular'),
          FABBottomAppBarItem(iconData: Icons.person, text: 'Profilim'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(context),
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.add];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: (int index) {
              setState(() {
                currentTab = index;
                currentPage = pages[index];
              });
            },
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Actions',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }
}
