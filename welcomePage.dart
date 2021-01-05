import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/src/registerPage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homePage.dart';
import 'registerPage.dart';

class SchoolNet extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SchoolNet',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomePage(title: 'SchoolNet Login Page'),
    );
  }
}

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int counter = 0;
  static TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Widget _createAccountLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Don\'t have an account ?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 10,
        ),
        _registerLabel()
      ],
    );
  }

  Widget _registerLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterPage()));
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Register',
              style: TextStyle(
                  color: Colors.blue[400],
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailFormField() {
    return Container(
      width: 300,
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.all(new Radius.circular(20.0))
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
      ),
    );
  }

  Widget _passwordFormField() {
    return Container(
      width: 300,
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.all(new Radius.circular(20.0))
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
      ),
    );
  }


  Widget _loginButton() {
    return InkWell(
      onTap : () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      },
      child: Container(
        width: 200,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.green.withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.green),
        ),
      ),
    );
  }

  static Widget title() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'School',
          style: GoogleFonts.portLligatSans(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white70
          ),
          children: [
           TextSpan(
             text: 'Net',
             style: TextStyle(color: Colors.black38, fontSize: 50)
           )
          ]
        ),

    );
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    //print('height: $height');
    //print('width: $width');

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        // This trailing comma makes auto-formatting nicer for build methods.
        body: Container(
          height: height,
          child: SingleChildScrollView(
            child:Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.green[500], Colors.green[100]])
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    SizedBox(height: height * .2),
                    title(),
                    SizedBox(height: 85),
                    _emailFormField(),
                    SizedBox(height: 15),
                    _passwordFormField(),
                    SizedBox(height: 60),
                    _loginButton(),
                    SizedBox(height: height * .22),
                    _createAccountLabel(),
                  ],
              )
            )
          ),
        )
      );
  }

}


