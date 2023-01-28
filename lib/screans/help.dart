
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

class help extends StatelessWidget {
  static String id='help';


  help({Key? key}) : super(key: key);

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
              margin: EdgeInsets.fromLTRB(76, 6, 5, 0),
              child: Text("Help",style: TextStyle(
                color:  Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: "El Messiri",
                fontSize: 31
              )),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(87, 0, 0, 1),
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
        child: ListView(
          children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                          width: 370,
                          height: 605,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(20)),
                            color: Color.fromARGB(90, 0, 0, 0),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(3, 40, 0, 5),
                                width: 165,
                                height: 165,
                                decoration: BoxDecoration(
                                  //color: const Color(0xff7c94b6),
                                  image: DecorationImage(
                                    image: ExactAssetImage('assets/help.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              
                              SizedBox(height: 30),
        
                              Padding(
                                  padding: const EdgeInsets.only(top:0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 10),
                                        child: Container(
                                          child: Text(
                                            'Dear customer, if you are facing a problem that is difficult for you to solve or a defect in one of the \nparts of the system, please contact technical support through our website or visit one of the \ncompany\'s branches shown \non the contact us page',textAlign: TextAlign.center, 
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                              fontFamily:'El Messiri',
                                            ),
                                          ), 
                                        ),
                                      ),
                                      SizedBox(height: 11),
                                      Container(
                                        child: Text(
                                          'Click On The Link : ',textAlign: TextAlign.center, 
                                          style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w900,
                                            fontFamily:'El Messiri',
                                          ),
                                        ), 
                                      ),
                                      
                                      Center(
                                        child: new InkWell(
                                          child: Container(
                                            child: Text(
                                              'https://www.facebook.com/robo.company ',textAlign: TextAlign.center, 
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900,
                                                fontFamily:'El Messiri',
                                                color: Color.fromARGB(255, 6, 52, 90),
                                              ),
                                            ), 
                                          ),
                                          onTap: () => launch('https://www.facebook.com/robo.company')
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
                  ),
                ],
              ),
          ],
        ),
      )
    );
  }
}
