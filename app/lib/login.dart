import 'package:flutter/material.dart';

class loginscreen extends StatelessWidget {
  loginscreen({super.key});
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.08,
                  ),
                  Text(
                    'Hello, Welcome back!',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.1,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.0599,
                  ),
                  Text(
                    'Water is life. Water is a basic human need. In various lines of life, humans need water.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: const Color.fromARGB(115, 62, 46, 46),
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            BorderSide(color: Color(0xfff49c63), width: 1.0),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Color(0xfff49c63),
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xfff49c63),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            BorderSide(color: Color(0xfff49c63), width: 1.0),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Color(0xfff49c63),
                        fontWeight: FontWeight.w500,
                      ),
                      prefixIcon: Icon(
                        Icons.password,
                        color: Color(0xfff49c63),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.123,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, '/create-account');
                    },
                    child: Text(
                      'Don’t have an account? create account',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.009,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {}
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xfff49c63),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.2,
                        vertical: screenHeight * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
