import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color primaryBlue =
      Color(0xFF00AEEF);

  static const Color darkBlue =
      Color(0xFF061C3D);

  static const Color cardBlue =
      Color(0xFF0B2B5B);

  @override
  Widget build(BuildContext context) {

    final user =
        Supabase.instance.client.auth.currentUser;

    return Scaffold(
      backgroundColor: darkBlue,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              const SizedBox(height: 20),

              // TOP BAR
              Row(
                children: [

                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),

                  const Spacer(),

                  const Text(
                    'Profile',

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Spacer(),

                  const SizedBox(width: 40),
                ],
              ),

              const SizedBox(height: 30),

              // AVATAR
              Container(
                width: 110,
                height: 110,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      primaryBlue,
                      primaryBlue.withOpacity(0.6),
                    ],
                  ),
                ),

                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 60,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                user?.email ?? 'No Email',

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Premium Member',

                style: TextStyle(
                  color:
                      Colors.white.withOpacity(0.7),
                ),
              ),

              const SizedBox(height: 40),

              profileTile(
                icon: Icons.person_outline,
                title: 'Account Settings',
              ),

              profileTile(
                icon: Icons.lock_outline,
                title: 'Privacy & Security',
              ),

              profileTile(
                icon: Icons.favorite_outline,
                title: 'Favorites',
              ),

              profileTile(
                icon: Icons.help_outline,
                title: 'Help Center',
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 58,

                child: ElevatedButton.icon(
                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                        18,
                      ),
                    ),
                  ),

                  onPressed: () async {

                    await Supabase.instance.client
                        .auth
                        .signOut();

                    if (!context.mounted) return;

                    Navigator.pushAndRemoveUntil(
                      context,

                      MaterialPageRoute(
                        builder: (_) =>
                            const AuthScreen(),
                      ),

                      (route) => false,
                    );
                  },

                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),

                  label: const Text(
                    'Logout',

                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileTile({
    required IconData icon,
    required String title,
  }) {

    return Container(
      margin: const EdgeInsets.only(
        bottom: 16,
      ),

      decoration: BoxDecoration(
        color: cardBlue,
        borderRadius:
            BorderRadius.circular(20),
      ),

      child: ListTile(
        leading: Icon(
          icon,
          color: primaryBlue,
        ),

        title: Text(
          title,

          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white54,
          size: 16,
        ),
      ),
    );
  }
}