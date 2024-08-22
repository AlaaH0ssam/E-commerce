import 'package:flutter/material.dart';

class CreateaccountScreen extends StatefulWidget {
  CreateaccountScreen({super.key});

  @override
  _CreateaccountScreenState createState() => _CreateaccountScreenState();
}

class _CreateaccountScreenState extends State<CreateaccountScreen> {
  final formkey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

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
                SizedBox(height: screenHeight * 0.08),
                Text(
                  'Create New Account',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.1,
                  ),
                ),
                SizedBox(height: screenHeight * 0.0599),
                Text(
                  'Water is life. Water is a basic human need. In various lines of life, humans need water.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: const Color.fromARGB(115, 62, 46, 46),
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: screenHeight * 0.09),
                TextFormField(
                  onChanged: (value) {
                    username = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                          color: Color(0xfff49c63), width: 1.0),
                    ),
                    labelText: 'Username',
                    labelStyle: const TextStyle(
                      color: Color(0xfff49c63),
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color(0xfff49c63),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                          color: Color(0xfff49c63), width: 1.0),
                    ),
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                      color: Color(0xfff49c63),
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Color(0xfff49c63),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: screenHeight * 0.02),
                TextFormField(
                  autofillHints: [AutofillHints.password],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    } else if (!RegExp(
                            r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])')
                        .hasMatch(value)) {
                      return 'Password must include upper, lower, number, and symbol';
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
                    labelStyle: const TextStyle(
                      color: Color(0xfff49c63),
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Color(0xfff49c63),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.1),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Have an account? Login',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.009),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Account created successfully')),
                      );
                      //////////////////HOME PAGE////////////////////////////////////////
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff49c63),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.2,
                      vertical: screenHeight * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
