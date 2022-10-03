import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0x117FBCD2),
        ),
        canvasColor: Color(0xffE1FFEE),
      ),
      darkTheme: ThemeData(
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
                      onPressed: () {
                        setState(() {
                          thememod == ThemeMode.light
                              ? thememod = ThemeMode.dark
                              : thememod = ThemeMode.light;
                        });
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
                      height: 20,
                    ),
                    Container(
                      height: 100,
                      child: Column(
                        children: [
                          Text("I'm"),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Gopal Shibu",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 15,
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
                    ),SizedBox(height: 10,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [IconButton(onPressed: () async{
                        
                        var url = 'https://instagram.com/therealgopal_';

                         
                      await launchUrl(
                        Uri.parse(url),
                        mode: LaunchMode.externalApplication,
                      );
                      }, icon: FaIcon(FontAwesomeIcons.instagram,)),
                      IconButton(onPressed: () async{
                        var url = 'https://github.com/gopalshibu142';

                         
                      await launchUrl(
                        Uri.parse(url),
                        mode: LaunchMode.externalApplication,
                      );
                    
                      }, icon: FaIcon(FontAwesomeIcons.github,)),
                      IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.linkedin,)),
                      IconButton(onPressed: () async{
                        var url = 'https://wa.me/7592806009';

                         
                      await launchUrl(
                        Uri.parse(url),
                        mode: LaunchMode.externalApplication,
                      );
                      }, icon: FaIcon(FontAwesomeIcons.whatsapp,)),
                      IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.facebook,))],
                    )
                  ],
                ),
              ))),
        ],
      ),
    );
  }
}
