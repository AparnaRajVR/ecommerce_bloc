import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_page/login_page.dart';
import 'profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
         child: Align(
          alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/dp.jpg'),
            ),
            const SizedBox(height: 20),
            ProfileContainer(
              title: 'Arathi G S',
              icon: Icons.person,
              onTap: () {
                
              },
            ),
            const SizedBox(height: 10),
            ProfileContainer(
              title: 'India',
              icon: Icons.location_on,
              onTap: () {
                
              },
            ),
            const SizedBox(height: 10),
            ProfileContainer(
              title: 'Settings',
              icon: Icons.settings,
              onTap: () {
                
              },
            ),
            const SizedBox(height: 10),
            ProfileContainer(
              title: 'Logout',
              icon: Icons.logout,
              isLogout: true,
              onTap: () async {
               
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Logout'),
                      content: const SingleChildScrollView(
                        child: ListBody(
                          children: [Text('Are you sure you want to logout?')],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            final prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setBool('isLoggedIn', false);
                            // Navigate to login screen
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          child: const Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}

