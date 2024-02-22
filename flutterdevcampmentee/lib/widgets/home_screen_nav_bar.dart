import 'package:flutter/material.dart';

import '../screens/profile_screen.dart';
import '../utils/constants.dart';
import 'search_field.dart';
import 'sidebar_button.dart';

class HomeScreenNavBar extends StatelessWidget {
  const HomeScreenNavBar({super.key, required this.triggerAnimation});

  final VoidCallback triggerAnimation;
  final String? photoURL =
      'https://sessionize.com/image/0ff2-400o400o2-QVfRi6pPoTybevVEjiDUML.jpg';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SidebarButton(
            triggerAnimation: triggerAnimation,
          ),
          const SearchField(),
          const Icon(
            Icons.notifications,
            color: kPrimaryLabelColor,
          ),
          const SizedBox(
            width: 16.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child:
                // const CircleAvatar(
                //   radius: 18.0,
                //   backgroundImage: AssetImage('assets/images/profile.png'),
                // ),
                CircleAvatar(
              backgroundColor: const Color(0xFFE7EEFB),
              radius: 18.0,
              child: (photoURL != null)
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(18.0),
                      child: Image.network(
                        photoURL!,
                        width: 36.0,
                        height: 36.0,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const Icon(Icons.person),
            ),
          ),
        ],
      ),
    );
  }
}
