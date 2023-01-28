// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main/screans/login.dart';


class ResetScreen extends StatefulWidget {
 static String id='ResetScreen';
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
   
  late String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon( Icons.arrow_back_ios, color: Colors.black,size: 28),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const login()),);
          } ,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(140, 0, 0, 0),
        title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 6, 5, 0),
                  child: const Text("Reset Password",style: const TextStyle(
                    color:  Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "El Messiri",
                    fontSize: 30,
                  )),
                ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(21, 0, 0, 1),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: const DecorationImage(
                      image: const ExactAssetImage('assets/logo5.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all( const Radius.circular(130)),
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
                        width: 1.25,
                      ),
                    ),
                  ),
            ],
          ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bk.jpg'),
              opacity: 0.25,
              fit: BoxFit.cover,
            ),
          ),
        child: ListView(
          children: 
            [Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Container(
                      width: 320,
                      height: 550,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all( Radius.circular(15)),
                        color: Color.fromARGB(90, 0, 0, 0),
                        border: Border.all(
                          color: Color.fromARGB(137, 60, 58, 58),
                          width: 2.5,
                        ), 
                      ),
                      child: Column(
                        children: [
                          Container(
        
                              margin: const EdgeInsets.fromLTRB(0, 20, 5, 5),
                              width: 200,
                              height: 180,
                              decoration: const BoxDecoration(
                                //color: const Color(0xff7c94b6),
                                image: DecorationImage(
                                  image: const ExactAssetImage('assets/reset.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          const SizedBox(height: 40),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                                child: Text(
                                  "Please, Enter Your Email And \nCheck Your Inbox/Spam To \nReceive Reset Link",textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    //letterSpacing: 1.5,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 40),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(  
                                    hintText: 'Email'
                                  ),
                                   onChanged: (value) {
                                    setState(() {
                                      _email = value.trim();
                                    });
                                  },
                                ),
                              ),
                             
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  RaisedButton(
                                    // ignore: prefer_const_constructors
                                    child: Text('Send Request',
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                      fontSize: 18
                                    ),
                                    ),
                                    onPressed: () {
                                      auth.sendPasswordResetEmail(email: _email);
                                      debugPrint("$_email");
                                      Navigator.of(context).pop();
                                    },
                                    color:Color.fromARGB(219, 68, 156, 229),
                                  ),
                                ],
                              ),
                            ],),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}