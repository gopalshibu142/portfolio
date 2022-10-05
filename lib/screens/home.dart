import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_animated_theme/animated_theme_app.dart';
import 'package:flutter_animated_theme/animation_type.dart';
import 'package:expandable/expandable.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:horizontal_card_pager/card_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ThemeMode thememod;
  late bool isdark;
  @override
  void initState() {
    thememod = ThemeMode.system;
    isdark = thememod == ThemeMode.dark ? true : false;
    super.initState();
  }

  var isstart = false;
  var str = "number is between 0 and 30";
  var chances = 8;
  late int number;
  TextEditingController controller = TextEditingController();
  Random r = Random();
  List imagelist = <ImageProvider>[
    AssetImage("assets/img1.jpg"),
    AssetImage("assets/img2.jpg"),
    AssetImage("assets/img3.jpg"),
  ];
  int indeximage = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedThemeApp(
        debugShowCheckedModeBanner: false,
        animationType: AnimationType.CIRCULAR_ANIMATED_THEME,
        animationDuration: Duration(milliseconds: 100),
        theme: ThemeData(
          textTheme: const TextTheme(),
          colorScheme: const ColorScheme.light(
            primary: Color(0x447900ee),
          ),
          canvasColor: Color(0xffE1FFEE),
        ),
        darkTheme: ThemeData(
            backgroundColor: Color(0xff100F0F),
            iconTheme: const IconThemeData(color: Colors.white54),
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: Colors.white,
                ),
            colorScheme: const ColorScheme.light(
              primary: Color(0x8816003B),
            ),
            canvasColor: Color(0xff100F0F)),
        themeMode: thememod,
        home: Scaffold(
          appBar: AppBar(
            shadowColor: Color(0xff251B37),
            title: Text(
              "Gopal Shibu",
              style: GoogleFonts.roboto(),
            ),
            actions: [
              IconButton(
                  onPressed: () async {
                    isdark = !isdark;
                    try {
                      setState(() {
                        thememod == ThemeMode.light
                            ? thememod = ThemeMode.dark
                            : thememod = ThemeMode.light;
                      });
                    } catch (e) {
                      print("error");
                    }
                    throw NullThrownError;
                  },
                  icon: thememod == ThemeMode.light
                      ? Icon(Icons.light_mode)
                      : Icon(Icons.dark_mode))
            ],
          ),
          body: SafeArea(
              child: SingleChildScrollView(
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
                          height: 8,
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
                          onPressed: () async {
                            var url =
                                'https://www.linkedin.com/in/gopal-shibu-b83232205/';

                            await launchUrl(
                              Uri.parse(url),
                              mode: LaunchMode.externalApplication,
                            );
                          },
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Projects",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Container(
                            margin: const EdgeInsets.all(30.0),
                    
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue.shade200, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: imagelist[indeximage],fit: BoxFit.cover)),
                            height: 300,
                            width: 230,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 280,
                        width: 350,
                        child: HorizontalCardPager(
                          initialPage: 3,
                          onPageChanged: (page) {
                            setState(() {
                              indeximage =(page%3).toInt();
                            });
                            
                          },
                          items: [
                            projects(
                              Colors.red,
                              0,
                            ),
                            projects(Colors.blue, 1),
                            projects(Colors.red, 2),
                            projects(Colors.blue, 0),
                            projects(Colors.red, 1),
                            projects(Colors.blue, 2),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 250,
                    alignment: Alignment.center,
                    child: ExpandablePanel(
                      header: Center(child: Text("Feeling Bored?")),
                      collapsed:
                          Center(child: Text("Try a number guessing game")),
                      expanded: Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(str),
                            Text("Chances : $chances"),
                            if (isstart)
                              Container(
                                width: 180,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      suffixIcon: isstart
                                          ? IconButton(
                                              onPressed: () {
                                                var value = controller.text;
                                                setState(() {
                                                  if (isstart) {
                                                    int no = int.parse(value);
                                                    if (no >= number - 3 &&
                                                        no < number)
                                                      str =
                                                          "number is small but near";
                                                    else if (no < number + 3 &&
                                                        no > number)
                                                      str =
                                                          "number is large but near";
                                                    else if (no > number + 3)
                                                      str =
                                                          "number is too large";
                                                    else if (no < number - 3)
                                                      str =
                                                          "number is too small";
                                                    else if (chances == 0) {
                                                      str = "Game Over";
                                                      isstart = false;
                                                    } else if (no == number) {
                                                      str = "Correct!!!";
                                                      isstart = false;
                                                    }
                                                    if (no != number) chances--;
                                                    if (chances == 0 &&
                                                        no != number) {
                                                      str = "Game over";
                                                      isstart = false;
                                                    }
                                                    controller.clear();
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                FontAwesomeIcons.circleCheck,
                                                color: Colors.green,
                                              ))
                                          : null),
                                  controller: controller,
                                ),
                              ),
                            ElevatedButton(
                                onPressed: isstart
                                    ? null
                                    : () {
                                        setState(() {
                                          str =
                                              "            guess the number\n(the number is between 0 and 19)";
                                          isstart = true;
                                          chances = 8;
                                          number = r.nextInt(20);
                                        });
                                      },
                                child: Text("Start")),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 100),

                  // Expanded(child: ScrollSnapList(itemBuilder:_projects , itemCount: 10, itemSize:35, onItemFocus:itemFocus,)),
                ],
              ),
            ),
          )),
        ));
  }

  ImageCarditem projects(Color clr, int i) {
    return ImageCarditem(
      image: Container(
        height: 200,
        width: 100,
        decoration: BoxDecoration(
            color: clr,
            image: DecorationImage(image: imagelist[i], fit: BoxFit.cover)),
      ),
    );
  }
}
