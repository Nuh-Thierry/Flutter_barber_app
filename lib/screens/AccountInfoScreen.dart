import 'package:barber/widgets/DarkModeContainer.dart';
import 'package:barber/widgets/ProfileContainer.dart';
import 'package:barber/widgets/languageContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({super.key});

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 12),
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/dv.jpg'),
                        radius: 80.0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'John Napstar',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'email: johnnapstar@gmail.com',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Divider(
                        height: 2,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ProfileContainer(
                icon: Icons.edit,
                name: 'Edit Profile',
              ),
              SizedBox(
                height: 10,
              ),
              ProfileContainer(
                icon: Icons.notifications,
                name: 'Notification',
              ),
              SizedBox(
                height: 10,
              ),
              ProfileContainer(
                icon: Icons.payment,
                name: 'Payments',
              ),
              SizedBox(
                height: 10,
              ),
              ProfileContainer(
                icon: Icons.security,
                name: 'Security',
              ),
              SizedBox(
                height: 10,
              ),
              LanguageContainer(),
              SizedBox(
                height: 10,
              ),
              DarkMode(switchValue: true),
              SizedBox(
                height: 10,
              ),
              ProfileContainer(
                icon: Icons.privacy_tip,
                name: 'Privacy Policy',
              ),
              SizedBox(
                height: 10,
              ),
              // Logout Container
              GestureDetector(
                onTap: () => FirebaseAuth.instance.signOut(),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.logout,
                            size: 30,
                            color: Colors.red,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      // Include the CustomBottomNavigationBar widget
    );
  }
}
