
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, camel_case_types, deprecated_member_use


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main/screans/home.dart';
import 'package:main/screans/home2.dart';
import 'package:main/screans/login.dart';
import 'package:main/screans/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:main/screans/splashscrean.dart';
//import 'package:main/colors.dart';

class about extends StatelessWidget {
  static String id='about';

  double  _drawerIconSize = 22;
  double _drawerFontSize = 20;
  final _drawercolor = Color.fromARGB(255, 170, 157, 157);

  about({Key? key}) : super(key: key);

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
              margin: EdgeInsets.fromLTRB(43, 6, 5, 0),
              child: Text("About Us",style: TextStyle(
                color:  Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: "El Messiri",
                fontSize: 31
              )),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(57, 0, 0, 1),
              width: 40,
              height: 40,
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
                    padding: const EdgeInsets.only(top:35),
                    child: Center(
                      child: Container(
                        child: Text(
                          '\t \t \t who are we ! \n and what we do ?',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            fontFamily:'Cinzel Decorative',
                          ),
                        ), 
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top:40),
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/logo3.png'),
                        fit: BoxFit.cover,
                      ), 
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 80),
                    child: Center(
                      child: Container(
                        child: Text(
                          " we are a team that decided \n to help people suffering \n from quadriplegia to make \n their lives easier for them \n and to lead a normal life \n like the rest of human \n beings without any help \n from anyone",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily:'Cinzel Decorative',
                          ),
                        ), 
                      ),
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