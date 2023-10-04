import 'package:flutter/material.dart';
import 'package:sayari/data.dart';
import 'package:sayari/main.dart';
import 'package:sayari/third.dart';

class second extends StatefulWidget {
  int index;
  second(this.index);

  @override
  State<second> createState() => _secondState();

}

class _secondState extends State<second> {

 static List s = [];

  @override
  void initState() {
    if(widget.index == 0)
      {
        s = data.bestwishes;
      }
    else if(widget.index == 1)
      {
      s = data.dosti;
      }
    else if(widget.index == 2)
    {
      s = data.majedar;
    }
    else if(widget.index == 3)
    {
      s = data.bhagwan;
    }
    else if(widget.index == 4)
    {
      s = data.prerna;
    }
    else if(widget.index == 5)
    {
      s = data.jivan;
    }
    else if(widget.index == 6)
    {
      s = data.Mohhabat;
    }
    else if(widget.index == 7)
    {
      s = data.Yade;
    }
    else if(widget.index == 8)
    {
      s = data.anay;
    }
    else if(widget.index == 9)
    {
      s = data.Rajniti;
    }
    else if(widget.index == 10)
    {
      s = data.Prem;
    }
    else if(widget.index == 11)
    {
      s = data.Dard;
    }
    else if(widget.index == 12)
    {
      s = data.shrab;
    }
    else if(widget.index == 13)
    {
      s = data.Bewafa;
    }
    else if(widget.index == 14)
    {
      s = data.Birthday;
    }
    else
    {
      s = data.Holi;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("SHAYARI"),),
      body: ListView.builder(
          itemCount: s.length,
          itemBuilder: (context , index){
            return Card(
              child : InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return third(s,index);
                  },));
                },

           child: ListTile(
             title: Text("${s[index]}",maxLines: 1,),
             // tileColor: temp[index]?Colors.red:null,
             // trailing: temp[index]?Icon(Icons.navigate_next_outlined):null,
             leading: Container(
               height: 50,
               width: 50,
               child: Image.asset("pic/${data.images[widget.index]}"),
             ),
           ),
              )
            );
          }),
    );
  }
}
