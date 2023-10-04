import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sayari/data.dart';
import 'package:sayari/forth.dart';
import 'package:share_plus/share_plus.dart';

class third extends StatefulWidget {
  List s;
  int index;
  third(this.s, this.index);

  @override
  State<third> createState() => _thirdState();
}
// List img = [""];

class _thirdState extends State<third> {
  PageController? pageController;
  int col_ind = 0;
  bool t = false;


  //
  @override
  void initState() {
    pageController = PageController(initialPage: widget.index);
    print("mihir");
  }

  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.height;
    double status = MediaQuery.of(context).padding.top;
    double app = kToolbarHeight;
    double t_height = screen - status - app;

    return Scaffold(
      appBar: AppBar(
          title: Text(
        "SHAYARI",
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      )),
      body: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Expanded(
                  child: Container(
                height: double.infinity,
                width: double.infinity,
                // color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Container(
                              height: t_height,
                              child: GridView.builder(
                                itemCount: data.colors.length - 1,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 5),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      t = true;
                                      col_ind = index;
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                        data.colors[index],
                                        data.colors[index + 1]
                                      ])),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("pic/expand.png"),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 55,
                        width: 55,
                        child: Text(
                          "${widget.index + 1}/${widget.s.length}",
                          style: TextStyle(fontSize: 20),
                        )),
                    InkWell(
                      onTap: () {
                        t = true;
                        int s = Random().nextInt(data.colors.length - 1);
                        col_ind = s;
                        setState(() {});
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("pic/reload.png"),
                      ),
                    )
                  ],
                ),
                // child: Image.asset("pic/bearbar.png"),
              )),
              Expanded(
                  flex: 6,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      widget.index = value;
                      setState(() {});
                    },
                    controller: pageController,
                    itemCount: widget.s.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: double.infinity,
                        width: double.infinity,
                        // color: Colors.pink,
                        alignment: Alignment.center,
                        child: Text(
                          "${widget.s[widget.index]}",
                          style: TextStyle(fontSize: 25),
                        ),
                        decoration: BoxDecoration(
                          color: (t == false) ? Colors.pink : null,
                          gradient: (t == true)
                              ? LinearGradient(colors: [
                                  data.colors[col_ind],
                                  data.colors[col_ind + 1]
                                ])
                              : null,
                        ),
                      );
                    },
                  )),
              Expanded(
                  child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                alignment: Alignment.center,
                // child: Image.asset("pic/god.png"),
              )),
              Expanded(
                  child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        FlutterClipboard.copy("${widget.s[widget.index]}")
                            .then((value) => print('copied'));
                        Fluttertoast.showToast(
                            msg: "COPY!.....",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.copy),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (widget.index > 0) {
                          widget.index--;
                          setState(() {});
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.arrow_back_ios_new),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return forth(widget.s, widget.index);
                          },
                        ));
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Image.asset("pic/pencil2.png"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (widget.index < widget.s.length - 1) {
                          widget.index++;
                          setState(() {});
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Share.share('check out my website https://example.com');
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.share),
                      ),
                    )
                  ],
                ),
                // child: Image.asset("pic/husband.png"),
              )),
            ],
          ))
        ],
      ),
    );
  }
}
