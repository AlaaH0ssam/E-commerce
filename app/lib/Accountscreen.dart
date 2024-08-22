import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  final String username;
  const AccountScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile
              Row(
                children: [
                  CircleAvatar(
                    radius: screenWidth * 0.09,
                    backgroundImage: const AssetImage(
                        'assets/images/Yellow Gradient Facebook Profile Picture.png'),
                  ),
                  SizedBox(
                    width: screenWidth * 0.04,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username: $username',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: screenHeight * 0.1),

              /////////////////SETTING PAGE////////////////////////
              Text(
                'Settings',
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: screenWidth * 0.035),
              ),
              SizedBox(height: screenHeight * 0.035),
              Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text('My Orders'),
                    onTap: () {
                      /////////////////ORDERS PAGE////////////////////////
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text('Account Settings'),
                    onTap: () {
                      /////////////////ACCOUNT SETTING PAGE////////////////////////
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text('Notification Settings'),
                    onTap: () {
                      /////////////////Notification SETTING PAGE////////////////////////
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('About Us'),
                    onTap: () {
                      /////////////////ABOUT US PAGE////////////////////////
                    },
                  ),
                ],
              ),

              // Buttons
              SizedBox(height: screenHeight * 0.1),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        ///////////////DELETE MY ACCOUNT/////////////////
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.122,
                          vertical: screenHeight * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Delete My Account',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    ElevatedButton(
                      onPressed: () {
                        ///////////////LOG OUT/////////////////
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
                      child: const Text(
                        'Log Out',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
