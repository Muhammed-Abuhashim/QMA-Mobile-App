import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../src/pages/call.dart';

class stream extends StatefulWidget {
  const stream({Key? key}) : super(key: key);
  static String id='stream';
  @override
  State<StatefulWidget> createState() => streamState();
}

class streamState extends State<stream> {
  
  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();

  /// if channel textField is validated to have error
  bool _validateError = false;

  ClientRole? _role = ClientRole.Broadcaster;

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

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
                  margin: const EdgeInsets.fromLTRB(40, 6, 5, 0),
                  child: const Text("Streaming",style: const TextStyle(
                    color:  Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "El Messiri",
                    fontSize: 30,
                  )),
                ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(54, 0, 0, 1),
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
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/bk.jpg'),
            opacity: 0.25,
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:40),
                    child: Center(
                      child: Container(
                        child: Text(
                          'Enter The channel \nAnd Click To Stream \nNow 📱',textAlign: TextAlign.center, 
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            fontFamily:'Cinzel Decorative',
                          ),
                        ), 
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Container(
                        width: 165,
                        height: 135,
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                          //color: const Color(0xff7c94b6),
                          image: const DecorationImage(
                            image: ExactAssetImage('assets/stream.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ),
                  SizedBox(height: 75),  
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: TextField(
                              controller: _channelController,
                              decoration: InputDecoration(
                                errorText:
                                    _validateError ? 'Channel name is mandatory' : null,
                                border: const UnderlineInputBorder(
                                  borderSide: const BorderSide(width: 1),
                                ),
                                hintText: 'Channel name',
                              ),
                            ))
                          ],
                        ),
                        
                        SizedBox(height: 60),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30),
                                  child: ElevatedButton(
                                  onPressed: onJoin, 
                                  child: const Text('Join',style: TextStyle(fontSize: 17.5),),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                                    foregroundColor: MaterialStateProperty.all(Colors.white) 
                                  ),
                                  ),
                                ),
                            ),
                            // Expanded(
                            //   child: RaisedButton(
                            //     onPressed: onJoin,
                            //     child: Text('Join'),
                            //     color: Colors.blueAccent,
                            //     textColor: Colors.white,
                            //   ),
                            // )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelController.text,
            role: _role,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}