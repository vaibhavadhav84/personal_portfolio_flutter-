import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/View/contactusscreen.dart';
import 'package:personal_portfolio/View/experiencescreen.dart';
import 'package:personal_portfolio/View/portfolio_page.dart';
import 'package:personal_portfolio/View/skillscreen.dart';
import 'package:url_launcher/url_launcher.dart';

class Projectscreen extends StatefulWidget {
  const Projectscreen({super.key});

  @override
  State<Projectscreen> createState() => _ProjectscreenState();
}

class _ProjectscreenState extends State<Projectscreen> {
  void openProjectUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      log("Could not launch $url");
    }
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF8FAFC), Color(0xFFE3F0F8), Color(0xFFF0F4F8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //////////////////////////////////////////////////////
              Row(
                children: [
                  Expanded(
                    child: _mobileNavButton("Home", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PortfolioPage()),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _mobileNavButton("Skill", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Skillscreen()),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(child: _mobileNavButton("Projects", () {})),
                ],
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: _mobileNavButton("Experience", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Experiencescreen()),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _mobileNavButton("Contact", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Contactusscreen()),
                      );
                    }),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // ///////////////////////////////////////////////////
              Text(
                "Projects :-",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 20),

              // ///////////////////////////////////////////////
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(25),
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
                      offset: Offset(0, 6),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    projectCardMobile(
                      title: "LookSmart - AI Style Advisor App",
                      description:
                          "An AI-powered styling app with color analysis, body shape detection, hairstyle recommendations, and a smart AI chat.",
                      image: "assets/logo/looksmart.jpg",
                      url: "https://github.com/vaibhavadhav84?tab=repositories",
                    ),

                    SizedBox(height: 25),

                    projectCardMobile(
                      title: "People Issue Reporting Platform",
                      description:
                          "A cross-platform issue reporting system using Flutter & JavaFX with Firebase Authentication and real-time updates.",
                      image: "assets/logo/logo1.png",
                      url: "https://github.com/vaibhavadhav84?tab=repositories",
                    ),

                    SizedBox(height: 25),

                    projectCardMobile(
                      title: "AI Chat Application",
                      description:
                          "A multi-platform AI chat application built using Flutter, JavaFX, and OpenAI with cloud/local storage sync.",
                      image: "assets/logo/chat.png",
                      url: "https://github.com/vaibhavadhav84?tab=repositories",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget desktopView() {
    return Container(
      // Modern Background (same theme as other pages)
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF8FAFC), Color(0xFFE3F0F8), Color(0xFFF0F4F8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),

            // ------------------------------------------------------------------
            //  Modern Navigation Header
            // ------------------------------------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _navButton("Home", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PortfolioPage()),
                  );
                }),
                SizedBox(width: 15),
                _navButton("Skill", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Skillscreen()),
                  );
                }),
                SizedBox(width: 15),
                _navButton("Experience", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Experiencescreen()),
                  );
                }),
                SizedBox(width: 15),
                _navButton("Projects", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Projectscreen()),
                  );
                }),
                SizedBox(width: 15),
                _navButton("Contact Me", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Contactusscreen()),
                  );
                }),
              ],
            ),

            SizedBox(height: 40),

            // ---------------------------------------------------------
            // Page Title
            // ---------------------------------------------------------
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                "Projects :-",
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SizedBox(height: 20),

            // ---------------------------------------------------------
            // Main Project Container (Glassmorphism)
            // ---------------------------------------------------------
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.92,
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
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
                      offset: Offset(0, 6),
                    ),
                  ],
                ),

                // -----------------------------------------------------
                //  Projects List Section
                // -----------------------------------------------------
                child: Wrap(
                  spacing: 35,
                  runSpacing: 35,
                  children: [
                    projectCard(
                      title: "LookSmart - AI Style Advisor App",
                      description:
                          "An AI-powered styling app with color analysis, body shape detection, hairstyle recommendations, and smart AI chat powered by OpenAI.",
                      image: "assets/logo/looksmart.jpg",
                      url: "https://github.com/vaibhavadhav84?tab=repositories",
                    ),
                    projectCard(
                      title: "People Issue Reporting Platform",
                      description:
                          "A cross-platform issue reporting system using Flutter & JavaFX with Firebase Authentication and real-time Firestore updates.",
                      image: "assets/logo/logo1.png",
                      url: "https://github.com/vaibhavadhav84?tab=repositories",
                    ),
                    projectCard(
                      title: "AI Chat Application",
                      description:
                          "A multi-platform AI chat application using Flutter, JavaFX, and OpenAI API with chat history stored in cloud and local storage.",
                      image: "assets/logo/chat.png",
                      url: "https://github.com/vaibhavadhav84?tab=repositories",
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget tabView() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF8FAFC), Color(0xFFE3F0F8), Color(0xFFF0F4F8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //////////////////////////////////////////////////////
              Row(
                children: [
                  Expanded(
                    child: _mobileNavButton("Home", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PortfolioPage()),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _mobileNavButton("Skill", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Skillscreen()),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(child: _mobileNavButton("Projects", () {})),
                ],
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: _mobileNavButton("Experience", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Experiencescreen()),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _mobileNavButton("Contact", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Contactusscreen()),
                      );
                    }),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // ///////////////////////////////////////////////////
              Text(
                "Projects :-",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 20),

              // ///////////////////////////////////////////////
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(25),
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
                      offset: Offset(0, 6),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    projectCardMobile(
                      title: "LookSmart - AI Style Advisor App",
                      description:
                          "An AI-powered styling app with color analysis, body shape detection, hairstyle recommendations, and a smart AI chat.",
                      image: "assets/logo/looksmart.jpg",
                      url: "https://github.com/vaibhavadhav84?tab=repositories",
                    ),

                    SizedBox(height: 25),

                    projectCardMobile(
                      title: "People Issue Reporting Platform",
                      description:
                          "A cross-platform issue reporting system using Flutter & JavaFX with Firebase Authentication and real-time updates.",
                      image: "assets/logo/logo1.png",
                      url: "https://github.com/vaibhavadhav84?tab=repositories",
                    ),

                    SizedBox(height: 25),

                    projectCardMobile(
                      title: "AI Chat Application",
                      description:
                          "A multi-platform AI chat application built using Flutter, JavaFX, and OpenAI with cloud/local storage sync.",
                      image: "assets/logo/chat.png",
                      url: "https://github.com/vaibhavadhav84?tab=repositories",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget projectCard({
    required String title,
    required String description,
    required String image,
    required String url,
  }) {
    return HoverButton(
      onTap: () {
        openProjectUrl(url);
      },
      child: Container(
        width: 340,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.55),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 6),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 18),

            // Title
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 10),

            // Description
            Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 20),

            // Source Code Button
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4A90E2), Color(0xFF357ABD)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  "Source Code",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget projectCardMobile({
    required String title,
    required String description,
    required String image,
    required String url,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse(url));
                  },
                  child: Text(
                    "View Project",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navButton(String label, VoidCallback onTap) {
    return HoverButton(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 28),
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
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
