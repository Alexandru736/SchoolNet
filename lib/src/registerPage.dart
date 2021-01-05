
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homePage.dart';
import 'welcomePage.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{

  List _accountTypes = ["Student", "Parent", "Teacher"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentAccountType;

  void initState() {

    _dropDownMenuItems = getDropDownMenuItems();
    _currentAccountType = _accountTypes[0];
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context, MaterialPageRoute(builder: (context) => WelcomePage()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  static Widget _title() {
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
          hintText: 'Enter your email',
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
          hintText: 'Enter a password',
          contentPadding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
      ),
    );
  }

  Widget _passwordInstructionLabel() {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Text(
                'Password must contain at least one number and one capital letter',
                style: TextStyle(
                    color: Colors.red[600],
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _confirmPasswordFormField() {
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
          hintText: 'Confirm password',
          contentPadding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
      ),
    );
  }

  Widget _alreadyHaveAnAccountLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Already have an account ?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 10,
        ),
        _loginLabel()
      ],
    );
  }

  Widget _loginLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomePage()));
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login',
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

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String accountType in _accountTypes) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(new DropdownMenuItem(
          value: accountType,
          child: new Text(accountType)
      ));
    }
    return items;
  }

  void changedDropDownItem(String selectedAccountType) {
    setState(() {
      _currentAccountType = selectedAccountType;
    });
  }

  Widget _accountTypeDropdownButton() {
    return Container(
      width: 300.0,
        decoration: BoxDecoration(
          border: Border(

          )
        ),
        child: DropdownButtonHideUnderline(
        child: ButtonTheme(
        alignedDropdown: true,
          child: DropdownButton(
            value: _currentAccountType,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
            // ignore: deprecated_member_use
            style: Theme.of(context).textTheme.title,
          )
        )
      ),
    );
  }

  Widget _textInput({controller, hint, icon}) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  Widget _registerButton() {
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
          'Register',
          style: TextStyle(fontSize: 20, color: Colors.green),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.green[500], Colors.green[100]])
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Positioned(top: 30, left: 0, child: _backButton()),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * .15),
                    _title(),
                    SizedBox(height: 60),
                    _textInput(hint: "Email", icon: Icons.email),
                    SizedBox(height: 10),
                    _textInput(hint: "Password", icon: Icons.vpn_key),
                    SizedBox(height: 5),
                    _passwordInstructionLabel(),
                    SizedBox(height: 10),
                    _textInput(hint: "Confirm password", icon: Icons.vpn_key),
                    SizedBox(height: 20),
                    _accountTypeDropdownButton(),
                    SizedBox(height: 20),
                    _registerButton(),
                    SizedBox(height: height * .11),
                    _alreadyHaveAnAccountLabel()
                  ],
                ),
              )
            ]
          ),
        )
      )
    );
  }
}