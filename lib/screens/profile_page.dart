import 'package:app_store/widget/show_edit_profile_dialogs.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static final String id = 'ProfilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String nameUser = 'Mahmoud Ibrahim';
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
                  const CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage(
                      'https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp',
                    ),
                  ),

                  const SizedBox(width: 14),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameUser,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      Text(
                        phoneUser,
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
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ShowEditProfileDialogs(
                        nameUser: nameUser,
                        phoneUser: phoneUser,
                        onUpdate: onUpdate,
                      );
                    },
                  );
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

  void onUpdate(String name, String phone) {
    setState(() {
      nameUser = name;
      phoneUser = phone;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully')),
    );
  }
}
