import 'package:flutter/material.dart';
import 'StartPage.dart';
import 'CreateAccount.dart';
import 'login.dart';

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
        '/': (context) => StartPage(),
        '/create-account': (context) => CreateaccountScreen(),
        '/login': (context) => loginscreen(), // Adding LoginScreen route
      },
    );
  }
}
