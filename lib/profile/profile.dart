import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Uri _urlGitHub = Uri.parse('https://github.com/akarshbr');
  final Uri _urlGitLab = Uri.parse('https://gitlab.com/akarshbr');
  final Uri _urlLinkedIn =
      Uri.parse('https://www.linkedin.com/in/akarsh-b-rajeev/');

  Future<void> _launchGitHub() async {
    if (!await launchUrl(_urlGitHub)) {
      throw Exception("Could Not launch $_urlGitHub");
    }
  }

  Future<void> _launchGitLab() async {
    if (!await launchUrl(_urlGitLab)) {
      throw Exception("Could Not launch $_urlGitLab");
    }
  }

  Future<void> _launchLinkedIn() async {
    if (!await launchUrl(_urlLinkedIn)) {
      throw Exception("Could Not launch $_urlLinkedIn");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipPath(
                  clipper: WaveClipperOne(),
                  child: Container(
                    height: 250,
                    color: Colors.blue.shade200,
                    child: Center(
                        child: Text(
                      "Profile",
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1
                      ),
                    )),
                  ),
                ),
                Center(
                  child: Text(
                    "Akarsh B Rajeev",
                    style: GoogleFonts.poppins(
                        fontSize: 50, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/dp/IMG_4274.heic"),
                          scale: 5,
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () async {
                          await _launchGitHub();
                        },
                        highlightColor: Colors.transparent,
                        icon: FaIcon(
                          FontAwesomeIcons.squareGithub,
                          size: 50,
                          color: Colors.black,
                        )),
                    IconButton(
                        onPressed: () async {
                          await _launchGitLab();
                        },
                        highlightColor: Colors.transparent,
                        icon: FaIcon(
                          FontAwesomeIcons.squareGitlab,
                          size: 50,
                          color: Colors.orange,
                        )),
                    IconButton(
                        onPressed: () async {
                          await _launchLinkedIn();
                        },
                        highlightColor: Colors.transparent,
                        icon: FaIcon(
                          FontAwesomeIcons.linkedin,
                          size: 50,
                          color: Colors.blue,
                        ))
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                        color: Colors.blue.shade100,
                        child: ListTile(
                          onTap: (){},
                          leading: Icon(
                            Icons.email_outlined,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Email",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            "akarshbrajeev@gmail.com",
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                        color: Colors.blue.shade100,
                        child: ListTile(
                          onTap: (){},
                          leading: FaIcon(FontAwesomeIcons.whatsapp,
                              color: Colors.black),
                          title: Text(
                            "Phone",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            "+91 8848743137",
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                        color: Colors.blue.shade100,
                        child: ListTile(
                          leading: Icon(Icons.maps_home_work_outlined,
                              color: Colors.black),
                          title: Text(
                            "Address",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            "SuryaKiran, Nuchilod\nPO Eachur, Kannur, 670591",
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}