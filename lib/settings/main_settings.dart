import 'package:olga/global/methods/methods.dart';
import 'package:olga/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:olga/screens/languages/choose_language.dart';
import 'package:provider/provider.dart';

import '../screens/visionboard/drawer/app_settings/change_language.dart';

class MainSettingScreen extends StatefulWidget {
  static const String id = "MainSettingScreen";
  const MainSettingScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<MainSettingScreen> {
  bool themeSwitch = false;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Change Theme"),
              trailing: Tooltip(
                message: "Theme Mode",
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFFDB84),
                  fontFamily: "Montserrat",
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      themeSwitch = !themeSwitch;
                      themeProvider.toggleTheme();
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFDB84),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: themeSwitch
                        ? const Icon(
                            Icons.dark_mode,
                            size: 20,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.light_mode,
                            size: 20,
                            color: Colors.black,
                          ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text("Change Language"),
              trailing: IconButton(
                onPressed: () {
                  goPage(context, const ChangeLanguage());
                },
                icon: const Icon(Icons.arrow_forward_ios_sharp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
