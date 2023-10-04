import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:sayari/data.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class forth extends StatefulWidget {
  // const forth({Key? key}) : super(key: key);
  List s;
  int index;

  forth(this.s,this.index);
  @override
  State<forth> createState() => _forthState();
}

class _forthState extends State<forth> {

  int col_index = 0;
  bool t = false;
  bool t1 = false;
  Color c = Colors.pink;
  Color d = Colors.white;
  double size = 20;
  WidgetsToImageController controller = WidgetsToImageController();
  Uint8List? bytes;
  String emoji = "😀 😃 😄 😁 😆 😅 😂 🤣 ";

  List font = ["f1","f2","f3","f4","f5","f5"];
  String cur_font = "f1";


  @override
  Widget build(BuildContext context) {

    double screen_height = MediaQuery.of(context).size.height;
    double status_height = MediaQuery.of(context).padding.top;
    double app_height = kToolbarHeight;
    double t_height = screen_height - status_height - app_height;
     return Scaffold(
      appBar: AppBar(title: Text("फोटो पर शायरी लिखे"),),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: WidgetsToImage(child: Container(
                margin: EdgeInsets.only(right: 10,left: 10,top: 40,bottom: 30),
                height: double.infinity,
                width: double.infinity,
                // color: Colors.red.shade800,
                child: Text("${emoji}\n${widget.s[widget.index]}\n${emoji}",
                  style: TextStyle(fontSize: size,color: d,fontFamily: cur_font),),
                decoration: BoxDecoration(
                  color: (t==false)?c:null,
                  gradient: (t==true)?LinearGradient(
                      colors: [data.colors[col_index],data.colors[col_index+1]]):null,
                ),
              ), controller: controller))
            ],
          )),
          Row(
            children: [
              Expanded(child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.brown.shade700,
                child: Column(
                  children: [
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {

                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            height: 30,
                            width: 50,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                              InkWell(
                                onTap: () {
                                  t = true;
                                  int s = Random().nextInt(data.colors.length - 1);
                                  col_index = s;
                                  setState(() {

                                  });
                                },
                                child:   Container(
                                  height: 30,
                                  width: 50,
                                  color: Colors.white,
                                  child: Image.asset("pic/reload.png"),
                                ),
                              ),
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: t_height,
                                          child: GridView.builder(
                                            itemCount: data.colors.length-1,
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 5,
                                                mainAxisSpacing: 5),
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  t = true;
                                                  col_index = index;
                                                  Navigator.pop(context);
                                                  setState(() {

                                                  });
                                                },
                                                child: Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [data.colors[index],
                                                            data.colors[index+1]])
                                                  ),
                                                ),
                                              );
                                            },),
                                        );
                                      },);
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 50,
                                    color: Colors.white,
                                    child: Image.asset("pic/expand.png"),
                                  ),
                                )
                              ],
                            )
                          ),
                        )),
                      ],
                    )),

                Expanded(child: Row(
                  children: [
                  Expanded(child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 200,
                              child: GridView.builder(
                                  itemCount: data.colors.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        t = false;
                                        c = data.colors[index];
                                        Navigator.pop(context);
                                        setState(() {

                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        color: data.colors[index],
                                      ),
                                    );
                                  },),
                            );
                          },);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10),
                      height: 70,
                      width: 100,
                      color: Colors.red.shade600,
                      child: Text("Background",
                        style: TextStyle(fontSize: 20,color: Colors.white),),
                    ),
                  )),

                    Expanded(child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 200,
                                child: GridView.builder(
                                  itemCount: data.colors.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          t = false;
                                          d = data.colors[index];
                                          Navigator.pop(context);
                                          setState(() {

                                          });
                                        },
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          color: data.colors[index],
                                        ),
                                      );
                                    },),
                              );
                            },);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        height: 70,
                        width: 100,
                        color: Colors.red.shade600,
                        child: Text("Text Color",
                          style: TextStyle(fontSize: 20,color: Colors.white),),
                      ),
                    )),

                    Expanded(child: InkWell(
                      onTap: () async {
                        final bytes = await controller.capture();
                        var path = await ExternalPath.getExternalStoragePublicDirectory
                          (ExternalPath.DIRECTORY_DOWNLOADS)+"/pic";
                        print(path);
                          Directory dir=Directory(path);

                          if(! await dir.exists())
                            {
                                  dir.create();
                            }

                          int r=Random().nextInt(100);
                          String img_name="${r}.jpg";
                          File f=File("${dir.path}/${img_name}");
                         await   f.writeAsBytes(bytes!);

                        Share.shareXFiles([XFile('${f.path}')], text: 'FROM MIHIR RAMOLIYA');
                          setState(() {

                          });

                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        height: 70,
                        width: 100,
                        color: Colors.red.shade600,
                        child: Text("Share",style: TextStyle(fontSize: 20,color: Colors.white),),
                      ),
                    ))
                ],
                )),
                    Expanded(child: Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return ListView.builder(
                                      itemCount: font.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            cur_font = font[index];
                                            Navigator.pop(context);
                                            setState(() {

                                            });
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 100,
                                            margin: EdgeInsets.only(right: 5,left: 5,top: 5,bottom: 5),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.black87,width: 2)
                                            ),
                                            child: Text("शायरी",style: TextStyle(fontSize: 20),),
                                          ),
                                        );
                                      },);
                                },);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            height: 70,
                            width: 100,
                            color: Colors.red.shade600,
                            child: Text("Font",style: TextStyle(fontSize: 20,color: Colors.white),),
                          ),
                        )),

                        Expanded(child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 200,
                                    child: ListView.builder(
                                        itemCount: data.emoji.length,
                                        itemBuilder: (context, index) {
                                          return Card(
                                            child: InkWell(
                                              onTap: () {
                                                  emoji = data.emoji[index];
                                                  Navigator.pop(context);
                                                  setState(() {

                                                  });
                                              },
                                              child: ListTile(
                                                tileColor: Colors.grey,
                                                title: Text("${data.emoji[index]}"),
                                              ),
                                            ),
                                          );
                                        },),
                                  );
                                },);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            height: 70,
                            width: 100,
                            color: Colors.red.shade600,
                            child: Text("emoji",style: TextStyle(fontSize: 20,color: Colors.white),),
                          ),
                        )),

                        Expanded(child: InkWell(
                          onTap: () {
                            showModalBottomSheet(context: context, builder: (context) {
                              return Container(
                                height: 150,
                                child: StatefulBuilder(builder: (context, setState1) {
                                  return Slider(
                                    max: 40,
                                    min: 20,
                                    value: size, onChanged: (value) {
                                      size = value;
                                      setState(() {

                                      });
                                      setState1(() {

                                      });
                                  },);
                                },),
                              );
                            },);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            height: 70,
                            width: 100,
                            color: Colors.red.shade600,
                            child: Text("Text Size",
                              style: TextStyle(fontSize: 20,color: Colors.white),),
                          ),
                        ))
                      ],
                    )),
                  ],
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
