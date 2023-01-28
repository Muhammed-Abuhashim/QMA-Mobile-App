
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, camel_case_types, deprecated_member_use


import 'package:flutter/material.dart';
import 'package:main/screans/about.dart';
import 'package:main/screans/contact.dart';
import 'package:main/screans/help.dart';
import 'package:main/screans/med_his.dart';
import 'package:main/screans/my_contact.dart';
import 'package:main/screans/profile_guardian.dart';
import 'package:main/screans/splashscrean.dart';
import 'package:main/screans/stream.dart';
import '../imagess.dart';
import '../otp.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'profile.dart';
//import 'package:main/colors.dart';


class home2_guardian extends StatefulWidget {
  static String id='home2_guardian';
  const home2_guardian({Key? key}) : super(key: key);

  @override
  State<home2_guardian> createState() => _home2_guardianState();
}

class _home2_guardianState extends State<home2_guardian>  {
  

  double  _drawerIconSize = 22;
  double _drawerFontSize = 20;
  double h = 46;
  final _drawercolor = Color.fromARGB(255, 170, 157, 157);

  int currentIndex = 0;

  final List<String> imageList = ["https://www.turkeyhealthcaregroup.com/wp-content/uploads/2016/01/%D8%A7%D9%85%D8%B1%D8%A7%D8%B6-%D8%A7%D9%84%D9%82%D9%84%D8%A8-768x649.jpg",
  'https://www.turkeyhealthcaregroup.com/wp-content/uploads/2016/01/%D9%85%D8%B1%D9%83%D8%B2-%D8%B2%D8%B1%D8%A7%D8%B9%D8%A9-%D8%A7%D9%84%D8%A7%D8%B9%D8%B6%D8%A7%D8%A1-768x649.jpg',
  'https://www.turkeyhealthcaregroup.com/wp-content/uploads/2019/07/%D8%A7%D9%84%D8%A7%D8%B4%D8%B9%D8%A9-%D8%A7%D9%84%D8%AA%D8%AF%D8%A7%D8%AE%D9%84%D9%8A%D8%A9-%D9%88%D8%A7%D9%84%D8%AA%D8%B5%D9%88%D9%8A%D8%B1-1-768x649.png',
  'https://www.turkeyhealthcaregroup.com/wp-content/uploads/2019/03/%D8%B2%D8%B1%D8%A7%D8%B9%D8%A9-%D8%A7%D9%84%D9%83%D9%84%D9%89-768x649.png',
  'https://www.turkeyhealthcaregroup.com/wp-content/uploads/2022/02/%D8%A5%D8%B2%D8%A7%D9%84%D8%A9-%D8%A7%D9%84%D9%85%D8%A7%D8%A1-%D8%A7%D9%84%D8%A7%D8%A8%D9%8A%D8%B6-%D9%81%D9%8A-%D8%A7%D9%84%D8%B9%D9%8A%D9%86.jpeg',];
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black,size: 30),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromARGB(140, 0, 0, 0),
        title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(64, 6, 5, 0),
                  child: Text("Home",style: TextStyle(
                    color:  Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "El Messiri",
                    fontSize: 35
                  )),
                ),

                  Container(
                    margin: EdgeInsets.fromLTRB(73, 0, 0, 1),
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
                        color: Color.fromARGB(255, 253, 255, 115),
                        width: 1.25,
                      ),
                    ),
                  ),
            ],
          ),
      ),
      
      drawer: Drawer(
        backgroundColor: Color.fromARGB(108, 0, 0, 0),
        child: Container(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/mm.jpg'),
                  fit: BoxFit.cover
                  )
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text("MENU",
                  style: TextStyle(fontSize: 40,color: Color.fromARGB(255, 206, 189, 189),fontFamily: "El Messiri", fontWeight: FontWeight.w800),
                  ),
                ),
              ),

              SizedBox(height:5),

              Container(
                height: h,
                child: ListTile(
                  leading: Icon(Icons.arrow_forward_ios, size: _drawerIconSize, color: _drawercolor),
                  title: Text('HOME', style: TextStyle(fontFamily: "El Messiri", fontWeight: FontWeight.w700,fontSize: _drawerFontSize, color:_drawercolor),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => home2_guardian()));
                  },
                ),
              ),

              SizedBox(height:5),

              Container(
                height: h,
                child: ListTile(
                  leading: Icon(Icons.arrow_forward_ios, size: _drawerIconSize, color: _drawercolor),
                  title: Text('PROFILE', style: TextStyle(fontFamily: "El Messiri", fontWeight: FontWeight.w700,fontSize: _drawerFontSize, color:_drawercolor),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => profile_guardian()));
                  },
                ),
              ),

              SizedBox(height:5),

              Container(
                height: h,
                child: ListTile(
                  leading: Icon(Icons.arrow_forward_ios, size: _drawerIconSize,color: _drawercolor),
                  title: Text('GPS',style: TextStyle(fontFamily: "El Messiri", fontWeight: FontWeight.w700,fontSize: _drawerFontSize,color: _drawercolor),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentLocationScreen()),);
                  },
                ),
              ),

              SizedBox(height:5),

              Container(
                height: h,
                child: ListTile(
                  leading: Icon(Icons.arrow_forward_ios, size: _drawerIconSize,color:_drawercolor),
                  title: Text('STREAM',style: TextStyle(fontFamily: "El Messiri", fontWeight: FontWeight.w700,fontSize: _drawerFontSize,color: _drawercolor),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => stream()),);
                  },
                ),
              ),

              SizedBox(height:5),

              Container(
                height: h,
                child: ListTile(
                  leading: Icon(Icons.arrow_forward_ios, size: _drawerIconSize,color: _drawercolor),
                  title: Text('ABOUT US',style: TextStyle(fontFamily: "El Messiri", fontWeight: FontWeight.w700,fontSize: _drawerFontSize,color: _drawercolor),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => about()),);
                  },
                ),
              ),

              SizedBox(height:5),

              Container(
                height: h,
                child: ListTile(
                  leading: Icon(Icons.arrow_forward_ios, size: _drawerIconSize,color:_drawercolor),
                  title: Text('CONTACT US',style: TextStyle(fontFamily: "El Messiri", fontWeight: FontWeight.w700,fontSize: _drawerFontSize,color: _drawercolor),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => contact()),);
                  },
                ),
              ),

              SizedBox(height:5),

              Container(
                height: h,
                child: ListTile(
                  leading: Icon(Icons.arrow_forward_ios, size: _drawerIconSize,color:  _drawercolor),
                  title: Text('HELP',style: TextStyle(fontFamily: "El Messiri", fontWeight: FontWeight.w700,fontSize: _drawerFontSize,color:_drawercolor),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => help()),);
                  },
                ),
              ),

              SizedBox(height:5),

              Container(
                height: h,
                child: ListTile(
                  leading: Icon(Icons.logout_rounded, size: _drawerIconSize,color: _drawercolor),
                  title: Text('Logout',style: TextStyle(fontFamily: "El Messiri", fontWeight: FontWeight.w700,fontSize: _drawerFontSize,color: _drawercolor),),
                  onTap: () {
                    //SystemNavigator.pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScrean()),);
                  },
                ),
              ),
              
              Container(
                margin: EdgeInsets.fromLTRB(10, 85, 0, 0),
                child: ListTile(
                  title: Text('VERSION  1.0',style: TextStyle(fontSize: 13,color: Color.fromARGB(235, 151, 147, 147),fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
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
            Container(
             child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: CarouselSlider.builder(
                        itemCount: imageList.length,
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: 250,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          reverse: false,
                          aspectRatio: 5.0,
                        ),
                        itemBuilder: (context, i, id){
                          //for onTap to redirect to another screen
                          return GestureDetector(
                            child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Color.fromARGB(142, 0, 0, 0),)
                            ),
                              //ClipRRect for image border radius
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  imageList[i],
                                width: 500,
                                fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: (){
                              var url = imageList[i];
                              print(url.toString());
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: GestureDetector(
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(15)),
                            image: DecorationImage(
                              image: AssetImage('assets/hs.png'),
                              //opacity: 0.25,
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(color: Colors.black38,width:2,),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => stream()),);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: GestureDetector(
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(15)),
                            image: DecorationImage(
                              image: AssetImage('assets/hmd.png'),
                              //opacity: 0.25,
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(color: Colors.black38,width:2,),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => med_his()),);
                        },
                      ),
                    ),
                  ],
                ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('assets/logo5.png'),
                      opacity: 0.65,
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
                        color: Color.fromARGB(255, 253, 255, 115),
                        width: 1.25,
                      ),
                    ),
                  ),
                
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: GestureDetector(
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(15)),
                            image: DecorationImage(
                              image: AssetImage('assets/hm.png'),
                              //opacity: 0.25,
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(color: Colors.black26,width:2,),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => my_contact()),);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: GestureDetector(
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all( Radius.circular(15)),
                            image: DecorationImage(
                              image: AssetImage('assets/hc.png'),
                              //opacity: 0.25,
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(color: Colors.black38,width:2,),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => contact()),);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      )
    );
  }

   Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        height: isSelected ? 12 : 10,
        width: isSelected ? 12 : 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}

