import 'package:client/util/transition.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../model/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../global/global.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthenticationScreenState();
  }
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> handleLogin() async{
    GoogleSignInAccount userAccount = await _googleSignIn.signIn();
    User user = User(userAccount.id, userAccount.email, userAccount.photoUrl);
    Global.user = user;
    print(Global.user);
    Navigator.of(context).push(NoTransition(builder: (BuildContext context){
      return HomePage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          new Column(children: [
            Spacer(flex: 1),
            Flexible(
                flex: 4,
                child: Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Container(
                    child: Text("Virtual Closet", style:TextStyle(fontSize: 20)),
                  ),
                )),
            Spacer(flex: 2),
            Flexible(
                flex: 4,
                child: Container(
                    child: Column(children: [
                  Container(
                      width: screenWidth * 0.7,
                      height: screenHeight * 0.08,
                      child: new RaisedButton(
                        child: Text('Log In With Google',
                            style: new TextStyle(
                              fontSize: 18,
                            )),
                        onPressed: handleLogin,
                        textColor: Colors.white,
                        color: Colors.blue,
                      )),
                ]))),
          ]),
        ]));
  }
}
