import 'package:bakcend3/FireBaseAuthService.dart';
import 'package:bakcend3/FirstScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());


}



class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<FireBaseAuthService>(

      create: (_) => FireBaseAuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);





  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<FireBaseAuthService>(context);

    return Scaffold(




      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [

              Colors.greenAccent.shade200,
              Colors.lightBlueAccent.shade100,
              Colors.cyan.shade200


            ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
          )
        ),
        child: Center(

          child: Column(


            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text('Login Into The FlutterFire App !', style: TextStyle( fontSize: 24, fontWeight: FontWeight.bold),),
              Padding(padding: EdgeInsets.all(10)),
              Container(
                width: 150,
                height: 75,

                decoration: BoxDecoration(
                    image:  DecorationImage(
                      fit: BoxFit.fill,
                        image: NetworkImage('https://meterpreter.org/wp-content/uploads/2018/09/flutter.png'))),),
             Padding(padding: EdgeInsets.all(10)),
              Text('Log in With Google Sign In :', style: TextStyle(decorationThickness: 10, fontSize: 12, color : Colors.black, fontWeight: FontWeight.bold)),

              OutlinedButton(onPressed: () {
                auth.signInWithGoogle().then((result) {
                  if (result != null) { Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return FirstScreen(context);
                                      },
                                  ),
                                );
                              }
                            });
                      },

                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder( borderRadius: BorderRadius.circular(40))),
                    elevation: MaterialStateProperty.all<double>(0),
                    side: MaterialStateProperty.all<BorderSide>(BorderSide(width: 1, color: Colors.grey))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(image: NetworkImage("http://logok.org/wp-content/uploads/2015/09/Google-logo-2015-G-icon.png"), height:35 ,),
                      Padding(
                          padding: EdgeInsets.only(left:10),
                          child: Text('Sign in with Google',
                           style: TextStyle( color: Colors.grey)
                          ),
                      )
                    ],
                  )
              ),



              Padding(padding: EdgeInsets.all(10)),
              Text('Designed By @FrenchNewbieCoder', style: TextStyle(fontWeight: FontWeight.bold),),

            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
