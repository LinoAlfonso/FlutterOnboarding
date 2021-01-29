import 'package:flutter/material.dart';
import 'package:onbording_provider_app/src/Services/LoginProvider.dart';
import 'package:onbording_provider_app/src/UI/onboarding/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> new LoginProvider() ),
      ],
      child: MaterialApp(
        title: 'Login',
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}


