// ignore_for_file: prefer_const_constructors, duplicate_ignore, camel_case_types, unused_import, avoid_unnecessary_containers, deprecated_member_use
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main/common/theme_helper.dart';
import 'package:main/screans/home.dart';
import 'package:main/screans/home2.dart';
import 'package:main/screans/sign_up.dart';

import 'reset.dart';
//import 'package:main/colors.dart';


class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);

  static String id='login';
  

  @override
  State<login> createState() => _loginState();
}

 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 bool obserText = true;


 void validation(){
    final FormState? _form = _formKey.currentState;
    if( _form!.validate()){
      print("Yes");
    }
    else{
      print("No");
    }
  }

class _loginState extends State<login> {

  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bk.jpg'),
                opacity: 0.25,
                fit: BoxFit.cover,
              ),
            ),
        
            child: ListView(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 50, 0, 10),
                              width: 148,
                              height: 148,
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
                                    blurRadius: 60,
                                    spreadRadius: 0.25,
                                    offset: Offset(10,40),
                                  ),                 
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 60,
                                    spreadRadius: 0.25,
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
                              padding: const EdgeInsets.only(bottom:65),
                              child: Center(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(85, 0, 0, 0),
                                      // ignore: prefer_const_constructors
                                      child: Text(
                                        'Welcome',
                                          style: TextStyle(
                                          fontSize: 53,
                                          fontWeight: FontWeight.w500,
                                          fontFamily:'Style Script',
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: const EdgeInsets.fromLTRB(4,0,0,5),
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: ExactAssetImage('assets/heart.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 25),
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:  <Widget>[  
                                  Container(
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (value) {email = value;},
                                      validator: (value){
                                        if (value ==""){
                                          return "Please Fill UserName";
                                        }
                                        else if(value!.length <= 3){
                                          return "UserName is Too Short";
                                        }
                                        return "";
                                      },
                                      textInputAction: TextInputAction.next,
                                      decoration: ThemeHelper().textInputDecoration('User Name', 'Enter your user name'),
                                    ),
                                    decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                  ),
              
                                  SizedBox(height: 30.0),

                                  Container(
                                    child: TextFormField(
                                      obscureText: obserText,
                                      onChanged: (value) {password = value;},
                                      validator: (value){
                                        if(value ==""){
                                          return "Please Fill password";
                                        }
                                        else if(value!.length < 8){
                                          return "Password is Too Short";
                                        }
                                        return "";
                                      },
                                      keyboardType: TextInputType.visiblePassword,
                                      decoration: ThemeHelper().textInputDecoration_2('Password', 'Enter your password'),
                                    ),
                                    decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                  ),
                                  
                                  SizedBox(height: 15),

                                  Container(
                                    margin: EdgeInsets.fromLTRB(10,0,10,20),
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push( context, MaterialPageRoute( builder: (context) => ResetScreen()), );
                                      },
                                      child: Text( "Forgot password?", style: TextStyle( 
                                        color: Color.fromARGB(255, 63, 63, 65),fontFamily: 'Joan',fontWeight: FontWeight.w800,fontSize: 17 ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 10),
            
                                  Container(
                                
                                    margin: const EdgeInsets.fromLTRB(31, 0, 0, 0),
                                    child: Row(
                                      children: <Widget>[
                                        Text("I Dont Have An Account !",style: 
                                          TextStyle(
                                            color: Color.fromARGB(255, 63, 63, 65),
                                            fontSize: 17,
                                            fontFamily: 'Joan',
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        GestureDetector(
                                          child: Text("\tSignUP",style: 
                                            TextStyle(
                                              color: Color.fromARGB(255, 21, 117, 146),
                                              fontSize: 18,
                                              fontFamily: 'Joan',
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => sign_up()),);
                                          },
                                        ),
                                      ]
                                    ),
                                  ),
                  
                                  SizedBox(height: 45),
                                
                                  Container(
                                    margin: const EdgeInsets.only(left: 75, right:75),
                                    height: 45,
                                    width: double.infinity,
                                    child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: BorderSide( width: 1.25 ),
                                    ),
                                      child: Text("LOGIN",style: new TextStyle(fontSize: 21.5,fontFamily: 'Joan',fontWeight: FontWeight.w800),),
                                      onPressed: ()  async {
                                        validation();
                                        try {
                                            await _auth.signInWithEmailAndPassword(
                                                email: email, password: password
                                            );
                                            await Navigator.of(context).push(
                                                MaterialPageRoute(
                                                builder: (contex) => home2(),
                                                ),
                                          );
                                        }
                                        on FirebaseAuthException catch (e) {
                                          showDialog(
                                            context: context,
                                              builder: (ctx) => AlertDialog(
                                                title: Text("Ops! Login Failed"),
                                                content: Text('${e.message}'),
                                              )
                                          );
                                        }
                                      },  
                                    ),
                                  ),
                                ]
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
        ),
      )
    );
  }
}

