
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, camel_case_types, deprecated_member_use, unnecessary_new


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main/screans/home.dart';
import 'package:main/screans/home2.dart';
import 'package:main/screans/login.dart';
import 'package:main/screans/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:main/screans/splashscrean.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:main/colors.dart';

class contact extends StatelessWidget {
  static String id='contact';

  double  _drawerIconSize = 22;
  double _drawerFontSize = 20;
  double  icon_width = 30.5;
  double  icon_height = 30.5;
  final _drawercolor = Color.fromARGB(255, 170, 157, 157);
  final toEmail='graduation_project2022@gmail.com';
  final phoneNumber='01202941341';

  contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon( Icons.arrow_back_ios, color: Colors.black,size: 28),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => home2()),);
          } ,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromARGB(140, 0, 0, 0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(28, 6, 5, 0),
              child: Text("Contact Us",style: TextStyle(
                color:  Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: "El Messiri",
                fontSize: 31
              )),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(48, 0, 0, 1),
              width: 38,
              height: 38,
              decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                image: ExactAssetImage('assets/logo5.png'),
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
                  color: Color.fromARGB(255, 238, 240, 137),
                  width: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
      
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

                  Padding(
                    padding: const EdgeInsets.only(top:15),
                    child: Center(
                      child: Container(
                        child: Text(
                          'Thank you for using\nour app 👏🏼',textAlign: TextAlign.center, 
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            fontFamily:'Cinzel Decorative',
                          ),
                        ), 
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top:20),
                    width: 330,
                    height: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all( Radius.circular(20)),
                      color: Color.fromARGB(90, 0, 0, 0),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(top:15),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                'To Communicate With Us :',textAlign: TextAlign.center, 
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w800,
                                  fontFamily:'El Messiri',
                                ),
                              ), 
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top:10),
                              child: Container(
                                child: Text(
                                  'Address : Arab Academy for \nScience, Technology & Maritime Transport, Abo Qir Campus',textAlign: TextAlign.center, 
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w800,
                                    fontFamily:'El Messiri',
                                  ),
                                ), 
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: GestureDetector(
                                child: Container(
                                  width: 310,
                                  height: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all( Radius.circular(15)),
                                    image: DecorationImage(
                                      image: AssetImage('assets/map.png'),
                                      //opacity: 0.25,
                                      fit: BoxFit.cover,
                                    ),
                                    border: Border.all(color: Colors.black26,width:2,),
                                  ),
                                ),
                                onTap: () => launch('https://goo.gl/maps/JoY5rNhcxfCSeBoi9')
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top:35),
                    width: 330,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all( Radius.circular(15)),
                      color: Color.fromARGB(90, 0, 0, 0), 
                    ),
                    child: Row(
                      children: [

                        Center(
                          child: new InkWell(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(19, 10, 10, 10),
                              width: icon_width,
                              height: icon_height,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/c.png'),
                                  //opacity: 0.25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () => launch('tel::$phoneNumber')
                          ),
                        ),

                        Center(
                          child: new InkWell(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              width: icon_width,
                              height: icon_height,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/s.png'),
                                  //opacity: 0.25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () => launch('https://www.youtube.com/')
                          ),
                        ),

                        Center(
                          child: new InkWell(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              width: icon_width,
                              height: icon_height,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/t.png'),
                                  //opacity: 0.25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () => launch('https://www.youtube.com/')
                          ),
                        ),

                        Center(
                          child: new InkWell(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              width: icon_width,
                              height: icon_height,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/w.png'),
                                  //opacity: 0.25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () => launch('https://www.youtube.com/')
                          ),
                        ),

                        Center(
                          child: new InkWell(
                            child: Container(
                                margin: EdgeInsets.all(10),
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/f.png'),
                                    //opacity: 0.25,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: () => launch('https://www.youtube.com/')
                          ),
                        ),

                        Center(
                          child: new InkWell(
                            child: Container(
                            margin: EdgeInsets.all(10),
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/e.png'),
                                //opacity: 0.25,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          onTap: () => launch('mailto:$toEmail?')
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ), 
      )
    );
  }
}
