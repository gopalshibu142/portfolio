import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_animated_theme/animated_theme_app.dart';
import 'package:flutter_animated_theme/animation_type.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ThemeMode thememod;

  @override
  void initState() {
    thememod = ThemeMode.system;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedThemeApp(
      debugShowCheckedModeBanner: false,
      animationType: AnimationType.CIRCULAR_ANIMATED_THEME,
      animationDuration: Duration(milliseconds: 200),
      theme: ThemeData(
        textTheme: const TextTheme(),
        colorScheme: const ColorScheme.light(
          primary: Color(0x447900ee),
        ),
        canvasColor: Color(0xffE1FFEE),
      ),
      darkTheme: ThemeData(
          iconTheme: const IconThemeData(color: Colors.white54),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
              ),
          colorScheme: const ColorScheme.light(
            primary: Color(0x8816003B),
          ),
          canvasColor: Color(0xff100F0F)),
      themeMode: thememod,
      home: Stack(
        children: [
          Container(
            height: double.infinity,
          ),
          Scaffold(
              appBar: AppBar(
                shadowColor: Color(0xff251B37),
                title: Text(
                  "Gopal Shibu",
                  style: GoogleFonts.roboto(),
                ),
                actions: [
                  IconButton(
                      onPressed: () async {
                        try {
                          setState(() {
                            thememod == ThemeMode.light
                                ? thememod = ThemeMode.dark
                                : thememod = ThemeMode.light;
                          });
                        } catch (e) {
                          print("error");
                        }
                      },
                      icon: thememod == ThemeMode.light
                          ? Icon(Icons.light_mode)
                          : Icon(Icons.dark_mode))
                ],
              ),
              body: SafeArea(
                  child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(30.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      width: 250,
                      child: Image.asset('assets/profile.jpg'),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Container(
                      height: 100,
                      child: Column(
                        children: [
                          Text("I'm"),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Gopal Shibu",
                            style: GoogleFonts.roboto(fontSize: 28),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          AnimatedTextKit(
                              isRepeatingAnimation: true,
                              repeatForever: true,
                              animatedTexts: [
                                FlickerAnimatedText('Android Developer'),
                                FlickerAnimatedText('Web Developer'),
                                FlickerAnimatedText('IOS Developer'),
                                FlickerAnimatedText('Windows Developer'),
                              ])
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () async {
                              var url = 'https://instagram.com/therealgopal_';

                              await launchUrl(
                                Uri.parse(url),
                                mode: LaunchMode.externalApplication,
                              );
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.instagram,
                            )),
                        IconButton(
                            onPressed: () async {
                              var url = 'https://github.com/gopalshibu142';

                              await launchUrl(
                                Uri.parse(url),
                                mode: LaunchMode.externalApplication,
                              );
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.github,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: FaIcon(
                              FontAwesomeIcons.linkedin,
                            )),
                        IconButton(
                            onPressed: () async {
                              var url = 'https://wa.me/7592806009';

                              await launchUrl(
                                Uri.parse(url),
                                mode: LaunchMode.externalApplication,
                              );
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.whatsapp,
                            )),
                        IconButton(
                            onPressed: () async {
                              var url = 'mailto:gopalshibu142@gmail.com';

                              await launchUrl(
                                Uri.parse(url),
                                mode: LaunchMode.externalApplication,
                              );
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.envelope,
                            ))
                      ],
                    )
                  ],
                ),
              ))),
        ],
      ),
    );
  }
}
