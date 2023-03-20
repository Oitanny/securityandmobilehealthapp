import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:video_player/video_player.dart';
class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  int currentIndex=0;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Image.asset("images/SAVElogo.png", height: 70,),
        centerTitle: true,
        leading:
        new IconButton(
        icon: new Icon(Icons.arrow_left_sharp,),
    onPressed: () => Navigator.of(context).pop(),
    ),
    foregroundColor: Color(0xFF02ffb1),
    backgroundColor: Color(0xFF01124b), //
    elevation: 0,
    // <-- SEE HERE
    ),


    body:new Container(
      color:  Color(0xFF01124b),
      padding: EdgeInsets.all(5),
      // decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //       colors: [
      //
      //         // Color(0xFF009FFD),
      //
      //       ],
      //     )
      // ),
      child: ListView(children: [
        Image.asset("images/vid.gif", height: 300,),



      ],)
      ),


      bottomNavigationBar: BottomNavigationBar(

        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index)=>setState(()=>currentIndex=index),

        backgroundColor: Color(0x0000aaff),
        items: [
          BottomNavigationBarItem( label:"",icon: AvatarGlow(child:Icon(Icons.border_all_rounded, color: Colors.white, size: 30), glowColor: Color(
              0xFFD800FF),endRadius: 27, duration: Duration(milliseconds: 24000000),repeatPauseDuration: Duration(milliseconds: 0),), backgroundColor:  Color(0xFF12115e)),
          BottomNavigationBarItem(label:"",icon: Icon(Icons.menu_book, color: Colors.white,size: 30,), backgroundColor:  Color(0xFF12115e)),
          BottomNavigationBarItem(label:"",icon: Icon(Icons.phone_android_outlined, color:Colors.white,size: 30,), backgroundColor:  Color(0xFF12115e)),
          BottomNavigationBarItem(label:"",icon: Icon(Icons.security_rounded, color: Colors.white,size: 30,), backgroundColor:  Color(0xFF12115e)),
          BottomNavigationBarItem(label:"",icon: Icon(Icons.person, color: Colors.white,size: 30,), backgroundColor:  Color(0xFF12115e))
        ],
      ),
        extendBody: true,

    );
  }
}