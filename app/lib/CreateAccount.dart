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
                SizedBox(height: screenHeight * 0.09),
                Text(
                  'Greetings!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.1,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'We are glad to see you here',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: screenHeight * 0.09),
                // Username Field
                TextFormField(
                  onChanged: (value) {
                    username = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                          color: const Color.fromARGB(255, 231, 205, 194),
                          width: 1.0),
                    ),
                    labelText: 'Username',
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(64, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color.fromARGB(81, 0, 0, 0),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                // Email Field
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
                          color: const Color.fromARGB(255, 231, 205, 194),
                          width: 1.0),
                    ),
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(64, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Color.fromARGB(81, 0, 0, 0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: screenHeight * 0.02),
                // Password Field
                TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                          color: const Color.fromARGB(255, 231, 205, 194),
                          width: 1.0),
                    ),
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(64, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color.fromARGB(81, 0, 0, 0),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: screenHeight * 0.083),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Account created successfully')),
                      );
                      Navigator.pushNamed(context, '/Home');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.085,
                      vertical: screenHeight * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Create account',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Already have an account? Sign in',
                    style: TextStyle(
                      color: Colors.black,
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
