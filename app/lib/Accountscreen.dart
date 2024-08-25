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
                      backgroundImage:
                          const AssetImage('../assets/images/ProfileIcon.png'),
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

                //setting
                Text(
                  'Settings',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.035),
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
                    ExpansionTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Account Settings'),
                      children: <Widget>[
                        ListTile(
                          title: const Text('Theme'),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Choose Theme'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        title: const Text('Light'),
                                        onTap: () {
                                          // Set theme to light
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ListTile(
                                        title: const Text('Dark'),
                                        onTap: () {
                                          // Set theme to dark
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        ListTile(
                          title: const Text('Language'),
                          onTap: () {},
                        ),
                      ],
                    ),

                    ExpansionTile(
                      leading: const Icon(Icons.notifications),
                      title: const Text('Notification Settings'),
                      children: <Widget>[
                        ListTile(
                          title: const Text('Enable Notifications'),
                          onTap: () {
                            // Handle enabling notifications
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      leading: const Icon(Icons.info),
                      title: const Text('About Us'),
                      children: <Widget>[
                        ListTile(
                          title: const Text('Contact Us'),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Text('Privacy Policy'),
                          onTap: () {},
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
                            onPressed: () {},
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black54,
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
              ],
            ),
          ),
        ));
  }
}
