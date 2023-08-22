import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/presentation/auth/pages/login_page.dart';
import 'package:flutter_defualt_project/presentation/auth/pages/signup_page.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({ this.isLoginPage=true,super.key});
 final bool isLoginPage;
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late bool isLoginPage ;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    isLoginPage=widget.isLoginPage;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: isLoginPage
          ? SafeArea(
            child: LoginPage(
                onChanged: () {
                  setState(() {
                    isLoginPage = false;
                  });
                },
              ),
          )
          : SafeArea(
            child: SignUpScreen(
                onChanged: () {
                  setState(() {
                    isLoginPage = true;
                  });
                }, parentContext: _scaffoldKey.currentContext!,
              ),
          ),
    );
  }
}
