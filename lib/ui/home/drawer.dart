import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_patient_portal/ui/home/chat_Screen.dart';
import 'package:hospital_patient_portal/utils/widgets/logo.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../utils/theme_data.dart'; // Add this for version info

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String _version = '';

  @override
  void initState() {
    super.initState();
    _getVersion();
  }

  Future<void> _getVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backGroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            child: Row(
              children: [
                Logo(size: 80.r),
                SizedBox(width: 16.w),
                Text(
                  'Patient Portal',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: appBarColor,
                      ),
                ),
              ],
            ),
          ),
          // Drawer options
          ListTile(
            leading: const Icon(Icons.person, color: accentColor),
            title: Text('Profile',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.black87)),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat, color: accentColor),
            title: Text('Chat',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.black87)),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ChatScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: accentColor),
            title: Text('Settings',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.black87)),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          const Spacer(), // Push logout and version number to the bottom
          ListTile(
            leading: const Icon(Icons.logout, color: accentColor),
            title: Text('Logout',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.black87)),
            onTap: () {
              // Handle logout action
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
            child: Text(
              'Version $_version',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
