
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:main/screans/home.dart';
//import 'package:main/colors.dart';

class SplashScrean extends StatefulWidget {
  static String id='SplashScrean';

  const SplashScrean({Key? key}) : super(key: key);

  @override
  State<SplashScrean> createState() => _SplashScreanState();
}

class _SplashScreanState extends State<SplashScrean> {

  @override
  void initState() {
    var d =Duration(seconds: 4);
    Future.delayed(d,(){
      Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(
      builder: (context) {
        return home();
      },
      ),
      (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kBackgroundColor,
      body: Container(
        decoration: BoxDecoration(
                 image: DecorationImage(
                    image: AssetImage('assets/bk.jpg'),
                    opacity: 0.25,
                    fit: BoxFit.cover,
                 ),
               ),
      
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Column(
              children: <Widget>[
                 Container(
                 width: 190,
                 height: 190,
                 decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: DecorationImage(
                  image: ExactAssetImage('assets/logo.jpeg'),
                  fit: BoxFit.cover,
                ),

                borderRadius: BorderRadius.all( Radius.circular(130)),
                boxShadow:[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 40,
                    spreadRadius: 3,
                    offset: Offset(10,40),
                  ),                 
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 40,
                    spreadRadius: 3,
                    offset: Offset(-10,40),
                  ),],
                   border: Border.all(
                     color: Color.fromARGB(255, 253, 255, 115),
                     width: 2.5,
                   ),
                 ),
                 ),
                 
                Padding(
                  padding: const EdgeInsets.only(top:40),
                  child: Center(
                  child: Container(
                    child: Text(
                      'Life Made Easier',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontFamily:'Cinzel',
                      ),
                    ),
                  ),
                ),
              ),

                SizedBox(height: 3),

                 Container(
                    child: Text(
                      'Your Health And Comfort Are Important To Us',
                      style: TextStyle
                      (fontSize: 13.5,
                      fontFamily: 'PT Serif Caption',
                      fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

              ],),
            ),
          ],
        ),
        
      )
    );
  }
}