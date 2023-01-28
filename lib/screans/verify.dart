// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class verify extends StatefulWidget {
 static String id='verify';
  @override
  _verifyState createState() => _verifyState();
}

class _verifyState extends State<verify> {
   
  late String _email;
  late String _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black,size: 30),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(140, 0, 0, 0),
        title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(24, 6, 5, 0),
                  child: const Text("Reset Password",style: const TextStyle(
                    color:  Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "El Messiri",
                    fontSize: 30,
                  )),
                ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(45, 0, 0, 1),
                    width: 43,
                    height: 43,
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
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bk.jpg'),
              opacity: 0.25,
              fit: BoxFit.cover,
            ),
          ),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 40, 5, 5),
                width: 200,
                height: 180,
                decoration: BoxDecoration(
                  //color: const Color(0xff7c94b6),
                  image: DecorationImage(
                    image: ExactAssetImage('assets/reset.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            SizedBox(height: 45),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 40),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(  
                      hintText: 'Email'
                    ),
                     onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 40),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(  
                      hintText: 'Password'
                    ),
                     onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
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
                        auth.signInWithEmailAndPassword(email: _email,password: _password);
                       
                        debugPrint("$_email");
                        Navigator.of(context).pop();
                      },
                      color:Color.fromARGB(102, 15, 126, 216),
                    ),
                  ],
                ),
              ],),
          ],
        ),
      ),
    );
  }
}