import 'package:flutter/material.dart';

import '../data.dart';

class AnaSayfa extends StatefulWidget {
  final List<Data> dataList;
  AnaSayfa({
    Key key,
    this.dataList,
  }) : super(key: key);

  @override
  AnaSayfaState createState() => AnaSayfaState();
}

class AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.dataList.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            key: PageStorageKey('${widget.dataList[index].id}'),
            title: Text(widget.dataList[index].title),
            // onExpansionChanged: (b) => setState(() {
            //       widget.dataList[index].expanded = b;
            //       PageStorage.of(context).writeState(context, b,
            //           identifier: ValueKey(
            //             '${widget.dataList[index].id}',
            //           ));
            //     }),
            // initiallyExpanded: widget.dataList[index].expanded,
            //  PageStorage.of(context).readState(
            //           context,
            //           identifier: ValueKey(
            //             '${widget.dataList[index].id}',
            //           ),
            //         ) ??
            //     false,
            children: <Widget>[
              Container(
                child: Text("Poliklinik Adı Buraya Gelecek"),
                color: index % 2 == 0 ? Colors.orange : Colors.limeAccent,
                height: 100.0,
              ),
            ],
          );
        });
  }
}
