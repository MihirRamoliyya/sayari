import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sayari/second.dart';
import 'package:sayari/data.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: sayari(),
  ));
}
class sayari extends StatefulWidget {
  const sayari({Key? key}) : super(key: key);

  @override
  State<sayari> createState() => _sayariState();
}
  List<bool> temp = List.filled(data.name.length, false);

class _sayariState extends State<sayari> {
  @override
  void initState() {
           get();
  }
  get()
  async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.storage,
      ].request();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("SHAYARI"),
        backgroundColor: Colors.pink,

      actions: [

        PopupMenuButton(itemBuilder: (context) => [
          PopupMenuItem(child: Text("Rate Us")),
          PopupMenuItem(child: Text("Share")),
          PopupMenuItem(child: Text("Our More apps")),
          PopupMenuItem(child: Text("Settings")),
        ],
          // padding:EdgeInsets.only(right: 60,left: 2),

          // icon: Icon(Icons.share),

        )
      ],),
      body: ListView.builder(
          itemCount: data.name.length,
          itemBuilder: (context, index) {
              return Card(
                child: GestureDetector(
                  onDoubleTapCancel: () {
                    temp[index] = false;
                    setState(() {

                    });
                  },
                  onTapDown: (details) {
                    temp[index] = true;
                    setState(() {

                    });
                  },
                  onTapUp: (details) {
                    temp[index] = false;
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return second(index);
                    },));
                    setState(() {

                    });
                  },
                  child: ListTile(
                    title: Text("${data.name[index]}"),
                    tileColor: (temp[index]?Colors.pink:null),
                    trailing: temp[index]?Icon(Icons.navigate_next_outlined):null,
                    leading: Container(
                      height: 50,
                      width: 50,
                      child: Image.asset("pic/${data.images[index]}"),
                    ),
                    // trailing: Icon(Icons.),
                  ),
                )
              );
          })
    );
  }
}

