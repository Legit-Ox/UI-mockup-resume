import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utilities/social_icon.dart';
import '../utilities/grey_box.dart';
import 'package:flutter/material.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  late Map<String, dynamic> myInfo = {};

  //Fetching content from the JSON file
  Future<void> fetchContent() async {
    final String response =
        await DefaultAssetBundle.of(context).loadString("assets/data.json");
    setState(() {
      myInfo = json.decode(response);
    });
  }

  @override
  void initState() {
    fetchContent();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 15, 15, 15),
        body: myInfo.isEmpty
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(children: [
                    GreyBox(
                      height: size.height * 0.07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(TextSpan(
                              text: 'Bim',
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color:
                                      const Color.fromARGB(255, 166, 163, 166)),
                              children: const <InlineSpan>[
                                TextSpan(
                                  text: 'Graph',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.bold),
                                )
                              ])),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.dehaze,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    GreyBox(
                      height: size.height * 0.3,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              decoration: BoxDecoration(
                                  color: const Color(0xFF8326FD),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${myInfo['hire_button']}',
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      '👋',
                                      style: GoogleFonts.roboto(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: AutoSizeText(
                              '${myInfo['hero_sentence']}',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              minFontSize: 36,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              maxLines: 3,
                            ),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        height: size.height * 0.2,
                        width: size.height * 0.2,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/keanudp.jpg'),
                                fit: BoxFit.cover),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    Center(
                      child: GreyBox(
                        height: size.height * 0.07,
                        width: size.width * 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: AutoSizeText(
                                'Name :',
                                style: GoogleFonts.poppins(
                                    color: const Color.fromARGB(
                                        255, 166, 163, 166)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: AutoSizeText(
                                '${myInfo['name']}',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: GreyBox(
                        // height: size.height * 0.15,
                        width: size.width * 0.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: AutoSizeText(
                                    'Based In :',
                                    style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 166, 163, 166)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: AutoSizeText(
                                    '${myInfo['based_in']}',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255)),
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  ),
                                )
                              ],
                            ),
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(
                                'assets/images/routes.png',
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: GreyBox(
                        // height: size.height * 0.07,
                        width: size.width * 0.7,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SocialIcon(
                                onHoverBackground:
                                    Color.fromARGB(255, 40, 105, 179),
                                icon: 'assets/icons/linkedin.svg'),
                            SocialIcon(
                                onHoverBackground:
                                    Color.fromARGB(255, 251, 89, 124),
                                icon: 'assets/icons/dribble.svg'),
                            SocialIcon(
                                onHoverBackground:
                                    Color.fromARGB(255, 3, 169, 245),
                                icon: 'assets/icons/twitter.svg'),
                            SocialIcon(
                                onHoverBackground:
                                    Color.fromARGB(255, 186, 51, 143),
                                icon: 'assets/icons/instagram.svg'),
                          ],
                        ),
                      ),
                    ),
                    GreyBox(
                      height: size.height * 0.5,
                      width: size.width * 0.9,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    'About',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                        color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    'Resume',
                                    style: GoogleFonts.poppins(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromARGB(
                                            255, 166, 163, 166)),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: size.height * 0.02),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, left: 8),
                                child: AutoSizeText(
                                  '${myInfo['about_description']}',
                                  maxFontSize: 48,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w200,
                                      color: const Color.fromARGB(
                                          255, 166, 163, 166)),
                                ),
                              ),
                            )
                          ]),
                    ),
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: GreyBox(
                              bgColor: const Color.fromARGB(255, 0, 195, 153),
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${myInfo['years_of_experience']}',
                                        style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      AutoSizeText(
                                        'Years Experience',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                            color: Colors.white),
                                        overflow: TextOverflow.fade,
                                        maxFontSize: 14,
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: GreyBox(
                              bgColor: const Color.fromARGB(255, 255, 193, 60),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${myInfo['handled_projects']}',
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Handled Projects',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: GreyBox(
                              bgColor: const Color.fromARGB(255, 255, 109, 122),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${myInfo['number_of_clients']}',
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Clients',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GreyBox(
                      width: size.width * 0.9,
                      height: size.height * 0.4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  'UI Portfolio',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                      color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  'See All',
                                  style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w300,
                                      color: const Color.fromARGB(
                                          255, 166, 163, 166)),
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                              )
                            ],
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 8,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: size.width * 0.6,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  '${myInfo['ui_portfolio'][index]['image']}'),
                                              fit: BoxFit.cover),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    )
                    // GreyBox(
                    //   height: size.height * 0.3,
                    //   child: Column(
                    //     children: [
                    //       const Text('UI Portfolio'),
                    //       PageView(
                    //         scrollDirection: Axis.horizontal,
                    //         children: [
                    //           GreyBox(
                    //             height: size.height * 0.2,
                    //             width: size.height * 0.2,
                    //           ),
                    //           GreyBox(
                    //             height: size.height * 0.2,
                    //             width: size.height * 0.2,
                    //           ),
                    //           GreyBox(
                    //             height: size.height * 0.2,
                    //             width: size.height * 0.2,
                    //           )
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // )
                  ]),
                ),
              ));
  }
}
