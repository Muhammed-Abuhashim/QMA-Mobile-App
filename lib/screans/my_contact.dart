
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

class my_contact extends StatelessWidget {
  static String id='my_contact';

  double  _drawerIconSize = 22;
  double _drawerFontSize = 20;
  double  icon_width = 35;
  double  icon_height = 35;
  final _drawercolor = Color.fromARGB(255, 170, 157, 157);
  final toEmail='graduation_project2022@gmail.com';
  final phoneNumber1='01202941341';
  final phoneNumber2='01145406660';
  final phoneNumber3='01280491414';
  final phoneNumber4='01115337705';
  final phoneNumber5='122';
  final phoneNumber6='123';

  my_contact({Key? key}) : super(key: key);

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
              margin: EdgeInsets.fromLTRB(20, 6, 5, 0),
              child: Text("My Contacts",style: TextStyle(
                color:  Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: "El Messiri",
                fontSize: 31
              )),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 0, 1),
              width: 43,
              height: 43,
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

                  Container(
                    margin: EdgeInsets.only(bottom:35),
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(122, 236, 210, 185),
                      image: DecorationImage(
                        image: ExactAssetImage('assets/c2.png'),
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
                        ),
                      ],
                        border: Border.all(
                          color: Color.fromARGB(239, 243, 207, 173),
                          width: 3.5,
                        ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    width: 330,
                    height: 430,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all( Radius.circular(20)),
                      color: Color.fromARGB(90, 0, 0, 0),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 15, 0, 0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  new InkWell(
                                    child: Container(
                                      margin: EdgeInsets.all(10),
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
                                    onTap: () => launch('tel::$phoneNumber1')
                                  ),
                                  Container(
                                    child: Text(
                                    'DAD \\ 01209241341', 
                                        style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        fontFamily:'El Messiri',
                                      ),
                                    ),
                                  ),  
                                ],
                              ),
                              

                              Row(
                                children: [
                                  new InkWell(
                                    child: Container(
                                      margin: EdgeInsets.all(10),
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
                                    onTap: () => launch('tel::$phoneNumber2')
                                  ),
                                  Container(
                                    child: Text(
                                    'MOM \\ 01145406660', 
                                        style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        fontFamily:'El Messiri',
                                      ),
                                    ),
                                  ),  
                                ],
                              ),

                              Row(
                                children: [
                                  new InkWell(
                                    child: Container(
                                      margin: EdgeInsets.all(10),
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
                                    onTap: () => launch('tel::$phoneNumber3')
                                  ),
                                  Container(
                                    child: Text(
                                    'BROThER \\ 01280491414', 
                                        style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        fontFamily:'El Messiri',
                                      ),
                                    ),
                                  ),  
                                ],
                              ),

                              Row(
                                children: [
                                  new InkWell(
                                    child: Container(
                                      margin: EdgeInsets.all(10),
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
                                    onTap: () => launch('tel::$phoneNumber4')
                                  ),
                                  Container(
                                    child: Text(
                                    'DOCTOR \\ 01115337705', 
                                        style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        fontFamily:'El Messiri',
                                      ),
                                    ),
                                  ),  
                                ],
                              ),

                              Row(
                                children: [
                                  new InkWell(
                                    child: Container(
                                      margin: EdgeInsets.all(10),
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
                                    onTap: () => launch('tel::$phoneNumber5')
                                  ),
                                  Container(
                                    child: Text(
                                    'POLICE \\ 122', 
                                        style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        fontFamily:'El Messiri',
                                      ),
                                    ),
                                  ),  
                                ],
                              ),

                              Row(
                                children: [
                                  new InkWell(
                                    child: Container(
                                      margin: EdgeInsets.all(10),
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
                                    onTap: () => launch('tel::$phoneNumber6')
                                  ),
                                  Container(
                                    child: Text(
                                    'AMBULANCE \\ 123', 
                                        style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        fontFamily:'El Messiri',
                                      ),
                                    ),
                                  ),  
                                ],
                              ),
                            ],
                          ),
                        ),

                        Container(
                              margin: EdgeInsets.only(top:16),
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all( Radius.circular(18)),
                                color: Color.fromARGB(134, 239, 206, 191), 
                              ),
                              child: Row(
                                children: [
                                  Center(
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child: Text(
                                          'Press On The Call Icon To Call',textAlign: TextAlign.center, 
                                          style: TextStyle(
                                            fontSize: 18.5,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w600,
                                            fontFamily:'Architects Daughter',
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
