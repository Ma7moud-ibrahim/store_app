import 'dart:io';

import 'package:app_store/models/user_profile.dart';
import 'package:app_store/screens/edit_profile_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static final String id = 'ProfilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String phoneUser = '010xxxxxxxxxx';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'More',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 30, bottom: 30),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 32,

                    backgroundImage: FileImage(UserProfile.image!),
                  ),

                  const SizedBox(width: 14),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        UserProfile.name!,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      Text(
                        UserProfile.phone!,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              customListTileProfile(
                icon: const Icon(
                  Icons.edit,
                  size: 35,
                  color: Colors.blueAccent,
                ),
                textName: const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(EditProfilePage.id);
                },
              ),
              customListTileProfile(
                icon: const Icon(
                  Icons.location_pin,
                  size: 35,
                  color: Colors.black,
                ),
                textName: const Text(
                  'My Address',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
              customListTileProfile(
                icon: const Icon(
                  Icons.shopping_bag,
                  size: 35,
                  color: Colors.black,
                ),
                textName: const Text(
                  'My Order',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
              customListTileProfile(
                icon: const Icon(
                  Icons.bolt,
                  size: 35,
                  color: Colors.blueAccent,
                ),
                textName: const Text(
                  'My Wilishist',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
              customListTileProfile(
                icon: const Icon(
                  Icons.chat_bubble,
                  size: 35,
                  color: Colors.green,
                ),
                textName: const Text(
                  'Chat With us',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
              customListTileProfile(
                icon: const Icon(Icons.call, size: 35, color: Colors.redAccent),
                textName: const Text(
                  'Take to Our Support',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),

              customListTileProfile(
                icon: const Icon(Icons.mail, size: 35, color: Colors.black),
                textName: const Text(
                  'Mail to us',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
              customListTileProfile(
                icon: const Icon(
                  Icons.facebook,
                  size: 35,
                  color: Colors.blueAccent,
                ),
                textName: const Text(
                  'Message to facebook page',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
              customListTileProfile(
                icon: const Icon(
                  Icons.exit_to_app,
                  size: 35,
                  color: Colors.red,
                ),
                textName: const Text(
                  'Log out',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  if (Platform.isAndroid) {
                    exit(0);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding customListTileProfile({
    required Icon icon,
    required Text textName,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: ListTile(leading: icon, title: textName, onTap: onTap),
    );
  }
}
