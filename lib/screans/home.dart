
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, camel_case_types


import 'package:flutter/material.dart';
import 'package:main/otp.dart';
import 'package:main/screans/home2.dart';
import 'package:main/screans/login.dart';
import 'package:main/screans/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:main/screans/splashscrean.dart';
import 'package:main/screans/verify.dart';

import 'reset.dart';
//import 'package:main/colors.dart';

class home extends StatelessWidget {
  static String id='home';

   home({Key? key}) : super(key: key);
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
                    margin: EdgeInsets.only(bottom:27),
                    width: 160,
                    height: 160,
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
                        ),
                      ],
                        border: Border.all(
                          color: Color.fromARGB(255, 253, 255, 115),
                          width: 2.5,
                        ),
                    ),
                  ),
                 
                  Padding(
                    padding: const EdgeInsets.only(bottom:190),
                    child: Center(
                        child: Container(
                        child: Text(
                          'Our Slogan Is Your Comfort',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            fontFamily:'Playball',
                          ),
                        ), 
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom:30),
                    child: Container(
                    margin: const EdgeInsets.only(left: 80, right: 80),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              // ignore: deprecated_member_use
                              child: FlatButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                              side: BorderSide(
                                                color: Color.fromARGB(255, 146, 146, 146),
                                                width: 2),
                                            ),
                                            onPressed: (){
                                              Navigator.push(
                                                context, 
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return login();
                                              },
                                            ),
                                          );
                                        }, 
                                            child: Container(
                                            padding:const EdgeInsets.symmetric(vertical: 7),
                                            alignment: Alignment.center,
                                            width: double.infinity,
                                            child: Text('Login',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 23.5,
                                              fontWeight: FontWeight.w800,
                                              fontFamily:'Satisfy',
                                              ),
                                            ),
                                          ),
                              ),
                            ),
                          ],
                        ),

                      SizedBox(height: 25),

                        Row(
                          children: [
                            Expanded(
                              // ignore: deprecated_member_use
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: Color.fromARGB(255, 146, 146, 146),width: 2)
                                ),
                                onPressed: (){
                                  Navigator.push(
                                    context, 
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return sign_up();
                                  },
                                ),
                              );
                            },  
                                child: Container(
                                padding:const EdgeInsets.symmetric(vertical: 8),
                                alignment: Alignment.center,
                                width: double.infinity,
                                child: Text('Sign Up',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  fontFamily:'Satisfy'
                                  ),
                                ),
                              ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ),
            ],),
            ),],
          ),
      )
    );
  }
}