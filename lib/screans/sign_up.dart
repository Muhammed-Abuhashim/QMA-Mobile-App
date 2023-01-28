

// ignore_for_file: camel_case_types, avoid_unnecessary_containers, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main/screans/guardian_sign_up.dart';
import 'package:main/screans/home.dart';
import 'package:main/screans/login.dart';
import 'package:main/screans/patient_sign_up.dart';

//import 'package:main/colors.dart';

class sign_up extends StatelessWidget {
  static String id='sign_up';

  
  const sign_up({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kBackgroundColor,
      body: Container(
        decoration: const BoxDecoration(
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
                  margin: const EdgeInsets.only(bottom:27),
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: const DecorationImage(
                      image: ExactAssetImage('assets/logo.jpeg'),
                      fit: BoxFit.cover,
                    ),

                    borderRadius: const BorderRadius.all( Radius.circular(130)),
                   boxShadow:[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 40,
                      spreadRadius: 3,
                      offset: const Offset(10,40),
                    ),                 
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 40,
                      spreadRadius: 3,
                      offset: const Offset(-10,40),
                    ),],
                    border: Border.all(
                      color: const Color.fromARGB(255, 253, 255, 115),
                      width: 2.5,
                    ),
                  ),
                ),
                 
                Padding(
                  padding: const EdgeInsets.only(bottom:155),
                  child: Center(
                    child: Container(
                      child: const Text(
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
              padding: const EdgeInsets.only(bottom:0),
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
                              side: const BorderSide(
                                color: Color.fromARGB(255, 146, 146, 146),
                                width: 2),
                            ),
                            onPressed: (){
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) {
                                    return patient_sign_up();
                              },
                            ),
                          );
                        }, 
                            child: Container(
                            padding:const EdgeInsets.symmetric(vertical: 7),
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: const Text('Patient',
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

                  const SizedBox(height: 25),

                    Row(
                      children: [
                        Expanded(
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(
                                color: Color.fromARGB(255, 146, 146, 146),
                                width: 2)
                            ),
                            onPressed: (){
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) {
                                    return  guardian_sign_up();
                              },
                            ),
                          );
                        },  
                            child: Container(
                            padding:const EdgeInsets.symmetric(vertical: 8),
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: const Text('Guardian',
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

                  const SizedBox(height: 25),

                    Row(
                      children: [
                        Expanded(
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(
                                color: Color.fromARGB(255, 146, 146, 146),
                                width: 2)
                            ),
                            onPressed: (){
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) {
                                    return  home();
                              },
                            ),
                          );
                        },  
                            child: Container(
                            padding:const EdgeInsets.symmetric(vertical: 8),
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: const Text('Back',
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
            ),
          ],
        ),
      )
    );
  }
}