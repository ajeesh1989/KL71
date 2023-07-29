import 'package:flutter/material.dart';

class drawerHead extends StatelessWidget {
  const drawerHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Colors.green.shade600,
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'KL71',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Explore Nilambur',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.green.shade600),
            title: const Text('Nilambur at a glance'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.green.shade600),
            title: const Text('Destinations'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.hotel, color: Colors.green.shade600),
            title: const Text('Stay'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.photo, color: Colors.green.shade600),
            title: const Text('Photos'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.video_library, color: Colors.green.shade600),
            title: const Text('Videos'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.social_distance, color: Colors.green.shade600),
            title: const Text('Social channels'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.green.shade600),
            title: const Text('About'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.green.shade600),
            title: const Text('Settings'),
            onTap: () {},
          ),
          const SizedBox(height: 50),
          Center(
            child: RichText(
              text: const TextSpan(
                text: 'Developer ',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'aj_labs',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
