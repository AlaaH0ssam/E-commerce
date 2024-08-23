import 'package:app/onboard.dart';
import 'package:app/spalsh.dart';
import 'package:flutter/material.dart';
//import 'StartPage.dart';
import 'CreateAccount.dart';
import 'login.dart';
import 'HomeScreen.dart';
import 'Accountscreen.dart';

void main() {
  runApp(const PetShop());
}

class PetShop extends StatelessWidget {
  const PetShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => splashScreen(),
        '/onboard': (context) => OnboardingScreen(),
        '/create-account': (context) => CreateaccountScreen(),
        '/login': (context) => loginscreen(),
        '/Home': (context) => HomeScreen(),
        '/Account': (context) => AccountScreen(username: ''),
      },
    );
  }
}
