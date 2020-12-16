import 'dart:ui';

import 'package:bakcend3/FireBaseAuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bakcend3/main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

Widget FirstScreen(BuildContext context) {
  final auth = Provider.of<FireBaseAuthService>(context);


  return Scaffold(
    appBar: AppBar(),

    body: Center(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade100,
              Colors.lightBlueAccent.shade100,
              Colors.blueAccent.shade100

            ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [


              Container(
                height: 100,
                width: 100,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(auth.user.photoURL))
                  ,),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              Text('Name:', style: TextStyle(fontSize: 15 ,color: Colors.grey, fontWeight: FontWeight.bold),),
              Text('French Newbie Coder', style: TextStyle(fontSize: 20 ,color: Colors.purple, fontWeight: FontWeight.bold), ),
              Padding(padding: EdgeInsets.all(5)),
              Text('Email Address:', style: TextStyle(fontSize: 15 ,color: Colors.grey, fontWeight: FontWeight.bold),),
              Padding(padding: EdgeInsets.all(5)),
              Text(auth.user.email, style: TextStyle(fontSize: 20 ,color: Colors.purple, fontWeight: FontWeight.bold),),
              Padding(padding: EdgeInsets.all(10)),
              OutlinedButton(onPressed: () {auth.signOutGoogle().then((value) => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Scaffold(appBar:AppBar(),body:Center(child: Text("aa")));
                        },
                       ),
                      )
                    );
                 },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                  elevation: MaterialStateProperty.all<double>(0.2)
                ),


                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                  Text('Sign Out', style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),)
                  ],
                ),

              ),


            ],
          ),
        ),
      ),
    ),
  );


}
