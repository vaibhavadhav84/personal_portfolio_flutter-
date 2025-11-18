import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/View/contactusscreen.dart';
import 'package:personal_portfolio/View/experiencescreen.dart';
import 'package:personal_portfolio/View/projectscreen.dart';
import 'package:personal_portfolio/View/skillscreen.dart';
import 'package:universal_html/html.dart' as html;

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  void downloadResume() async {
    final byteData = await rootBundle.load('assets/resume.pdf');

    final blob = html.Blob([byteData.buffer.asUint8List()]);
    final url = html.Url.createObjectUrlFromBlob(blob);

    html.AnchorElement(href: url)
      ..download = "Vaibhav_Resume.pdf"
      ..click();

    html.Url.revokeObjectUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth < 800
              ? mobileView()
              : constraints.maxWidth < 1200
              ? tabView()
              : desktopView();
        },
      ),
    );
  }

  Widget mobileView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF8FAFC), Color(0xFFE3F0F8), Color(0xFFF0F4F8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              // ///////////////////////////////////////////////
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _mobileNavButton("Home", () {}),
                      _mobileNavButton("Skill", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Skillscreen()),
                        );
                      }),
                      _mobileNavButton("Projects", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Projectscreen()),
                        );
                      }),
                    ],
                  ),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _mobileNavButton("Experience", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Experiencescreen()),
                        );
                      }),
                      _mobileNavButton("Contact", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Contactusscreen()),
                        );
                      }),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 30),

              // //////////////////////////////////////////////
              Container(
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.45),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, I am Vaibhav Adhav",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "I am a passionate Flutter & Full-Stack Developer with strong experience in mobile app development, AI-powered applications, and cross-platform solutions using Flutter, Java, React.js, Firebase, and RESTful APIs.\n\n"
                      "I love building user-friendly digital experiences and powerful apps with clean UI and AI integration.",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 25),

                    Column(
                      children: [
                        _filledActionButton("Download Resume"),
                        SizedBox(height: 15),
                        _outlineButton("Contact Me"),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    "assets/image/vaibhav.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget desktopView() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF8FAFC), Color(0xFFE3F0F8), Color(0xFFF0F4F8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),

            // /////////////////////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _topButton("Home", () {}),
                SizedBox(width: 20),
                _topButton("Skill", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Skillscreen()),
                  );
                }),
                SizedBox(width: 20),
                _topButton("Experience", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Experiencescreen()),
                  );
                }),
                SizedBox(width: 20),
                _topButton("Projects", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Projectscreen()),
                  );
                }),
                SizedBox(width: 20),
                _topButton("Contact Me", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Contactusscreen()),
                  );
                }),
              ],
            ),

            SizedBox(height: 40),

            // ///////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.45),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.4),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 12,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, I am Vaibhav Adhav",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.02,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),

                          SizedBox(height: 20),

                          Text(
                            "I am a passionate Flutter & Full-Stack Developer with strong experience in mobile app development, AI-powered applications, and cross-platform solutions using Flutter, Java, React.js, Firebase, and RESTful APIs. I love turning ideas into real, user-friendly digital experiences—whether it’s an AI style advisor, an issue-reporting system, or intelligent chat applications.\n\n"
                            "With a solid foundation in Java, Dart, JavaScript, and hands-on experience with Firebase, OpenAI APIs, and responsive UI/UX design, I enjoy building scalable apps that blend performance, clean design, and functionality.\n\n"
                            "Explore my portfolio to see how I blend creativity, AI integration, and engineering to build impactful applications!",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.012,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),

                          SizedBox(height: 30),

                          Row(
                            children: [
                              _filledActionButton("Download Resume"),
                              SizedBox(width: 20),
                              _outlineButton("Contact Me"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 60),

                  // -----------------------------------------------------
                  // Right Side Profile Image Modern Card
                  // -----------------------------------------------------
                  Container(
                    height: MediaQuery.of(context).size.height * 0.70,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        "assets/image/vaibhav.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget tabView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF8FAFC), Color(0xFFE3F0F8), Color(0xFFF0F4F8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              // ///////////////////////////////////////////////
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _mobileNavButton("Home", () {}),
                      _mobileNavButton("Skill", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Skillscreen()),
                        );
                      }),
                      _mobileNavButton("Projects", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Projectscreen()),
                        );
                      }),
                    ],
                  ),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _mobileNavButton("Experience", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Experiencescreen()),
                        );
                      }),
                      _mobileNavButton("Contact", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Contactusscreen()),
                        );
                      }),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 30),

              // //////////////////////////////////////////////
              Container(
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.45),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, I am Vaibhav Adhav",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "I am a passionate Flutter & Full-Stack Developer with strong experience in mobile app development, AI-powered applications, and cross-platform solutions using Flutter, Java, React.js, Firebase, and RESTful APIs.\n\n"
                      "I love building user-friendly digital experiences and powerful apps with clean UI and AI integration.",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 25),

                    Column(
                      children: [
                        _filledActionButton("Download Resume"),
                        SizedBox(height: 15),
                        _outlineButton("Contact Me"),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    "assets/image/vaibhav.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topButton(String label, VoidCallback onTap) {
    return HoverButton(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.black12, width: 1.4),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _mobileNavButton(String title, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _filledActionButton(String label) {
    return HoverButton(
      onTap: () {
        downloadResume();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4A90E2), Color(0xFF357ABD)],
          ),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _outlineButton(String label) {
    return HoverButton(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Contactusscreen()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.black26, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class HoverButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const HoverButton({super.key, required this.child, required this.onTap});

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 180),
        transform: isHover
            ? (Matrix4.identity()..scale(1.05))
            : Matrix4.identity(),
        child: GestureDetector(onTap: widget.onTap, child: widget.child),
      ),
    );
  }
}
