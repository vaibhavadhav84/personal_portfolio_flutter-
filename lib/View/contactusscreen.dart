import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/View/experiencescreen.dart';
import 'package:personal_portfolio/View/portfolio_page.dart';
import 'package:personal_portfolio/View/projectscreen.dart';
import 'package:personal_portfolio/View/skillscreen.dart';
import 'package:url_launcher/url_launcher.dart';

class Contactusscreen extends StatefulWidget {
  const Contactusscreen({super.key});

  @override
  State<Contactusscreen> createState() => _ContactusscreenState();
}

class _ContactusscreenState extends State<Contactusscreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  void openProjectUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      log("Could not launch $url");
    }
  }

  void sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: "vaibhavadhav84@gmail.com",
      query:
          "subject=New Message from Portfolio"
          "&body=Name: ${nameController.text}%0A"
          "Email: ${emailController.text}%0A"
          "Message: ${messageController.text}",
    );

    await launchUrl(emailUri);
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
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ///////////////////////////////////////////////////////////////
              Row(
                children: [
                  Expanded(
                    child: _mobileNav("Home", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PortfolioPage()),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _mobileNav("Skill", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Skillscreen()),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _mobileNav("Projects", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Projectscreen()),
                      );
                    }),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: _mobileNav("Experience", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Experiencescreen()),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(child: _mobileNav("Contact", () {})),
                ],
              ),

              SizedBox(height: 30),

              // //////////////////////////////////////////////////////////
              Text(
                "Contact Me :-",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 25),

              // ///////////////////////////////////////////////////////////
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ///////////////////////////////////////////////////////////
                    contactInfo(
                      icon: Icons.email,
                      title: "Email:",
                      value: "vaibhavadhav84@gmail.com",
                    ),
                    SizedBox(height: 18),

                    contactInfo(
                      icon: Icons.phone,
                      title: "Phone:",
                      value: "8412836927",
                    ),
                    SizedBox(height: 18),

                    contactInfo(
                      icon: Icons.location_pin,
                      title: "Location:",
                      value: "Pune, Maharashtra, India",
                    ),
                    SizedBox(height: 18),

                    contactInfo(
                      icon: Icons.link,
                      title: "LinkedIn:",
                      value: "https://www.linkedin.com/in/vaibhavadhav84/",
                    ),
                    SizedBox(height: 18),

                    contactInfo(
                      icon: Icons.code,
                      title: "GitHub:",
                      value:
                          "https://github.com/vaibhavadhav84?tab=repositories",
                    ),

                    SizedBox(height: 35),

                    // ///////////////////////////////////////////////////////////
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFF0E1428),
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),

                      child: Column(
                        children: [
                          inputField("Your Name", controller: nameController),
                          SizedBox(height: 15),

                          inputField("Your Email", controller: emailController),
                          SizedBox(height: 15),

                          inputField(
                            "Your Message",
                            maxLines: 5,
                            controller: messageController,
                          ),
                          SizedBox(height: 25),

                          // SEND BUTTON
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF5D6BFF),
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 5,
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Message Sent Successfully!",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  backgroundColor: Colors.green,
                                  behavior: SnackBarBehavior.floating,
                                  duration: Duration(seconds: 2),
                                  margin: EdgeInsets.all(18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              "Send Message",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF8FAFC), Color(0xFFE3F0F8), Color(0xFFF0F4F8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),

              // //////////////////////
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

              // //////////////////////
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  "Contact Me :-",
                  style: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              SizedBox(height: 20),

              // //////////////////////
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.92,
                  padding: EdgeInsets.all(45),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ////////////////////////////
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            contactInfoDesktop(
                              icon: Icons.email,
                              title: "Email:",
                              value: "vaibhavadhav84@gmail.com",
                            ),
                            SizedBox(height: 20),

                            contactInfoDesktop(
                              icon: Icons.phone,
                              title: "Phone:",
                              value: "8412836927",
                            ),
                            SizedBox(height: 20),

                            contactInfoDesktop(
                              icon: Icons.location_pin,
                              title: "Location:",
                              value: "Pune, Maharashtra, India",
                            ),
                            SizedBox(height: 20),

                            contactInfoDesktop(
                              icon: Icons.link,
                              title: "LinkedIn:",
                              value:
                                  "https://www.linkedin.com/in/vaibhavadhav84/",
                            ),
                            SizedBox(height: 20),

                            contactInfoDesktop(
                              icon: Icons.code,
                              title: "GitHub:",
                              value:
                                  "https://github.com/vaibhavadhav84?tab=repositories",
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 50),

                      // ////////////////////////
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(35),
                          decoration: BoxDecoration(
                            color: Color(0xFF0E1428),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.25),
                                blurRadius: 12,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              inputField(
                                "Your Name",
                                controller: nameController,
                              ),
                              SizedBox(height: 15),

                              inputField(
                                "Your Email",
                                controller: emailController,
                              ),
                              SizedBox(height: 15),

                              inputField(
                                "Your Message",
                                maxLines: 5,
                                controller: messageController,
                              ),
                              SizedBox(height: 25),

                              // Send Message Button
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF5D6BFF),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 5,
                                ),
                                onPressed: () {
                                  // sendEmail();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Message Sent Successfully!",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      backgroundColor: Colors.green,
                                      behavior: SnackBarBehavior.floating,
                                      duration: Duration(seconds: 2),
                                      margin: EdgeInsets.all(20),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Send Message",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 60),
            ],
          ),
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
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ///////////////////////////////////////////////////////////////
              Row(
                children: [
                  Expanded(
                    child: _mobileNav("Home", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PortfolioPage()),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _mobileNav("Skill", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Skillscreen()),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _mobileNav("Projects", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Projectscreen()),
                      );
                    }),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: _mobileNav("Experience", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Experiencescreen()),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(child: _mobileNav("Contact", () {})),
                ],
              ),

              SizedBox(height: 30),

              // //////////////////////////////////////////////////////////
              Text(
                "Contact Me :-",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 25),

              // ///////////////////////////////////////////////////////////
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ///////////////////////////////////////////////////////////
                    contactInfo(
                      icon: Icons.email,
                      title: "Email:",
                      value: "vaibhavadhav84@gmail.com",
                    ),
                    SizedBox(height: 18),

                    contactInfo(
                      icon: Icons.phone,
                      title: "Phone:",
                      value: "8412836927",
                    ),
                    SizedBox(height: 18),

                    contactInfo(
                      icon: Icons.location_pin,
                      title: "Location:",
                      value: "Pune, Maharashtra, India",
                    ),
                    SizedBox(height: 18),

                    contactInfo(
                      icon: Icons.link,
                      title: "LinkedIn:",
                      value: "https://www.linkedin.com/in/vaibhavadhav84/",
                    ),
                    SizedBox(height: 18),

                    contactInfo(
                      icon: Icons.code,
                      title: "GitHub:",
                      value:
                          "https://github.com/vaibhavadhav84?tab=repositories",
                    ),

                    SizedBox(height: 35),

                    // ///////////////////////////////////////////////////////////
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFF0E1428),
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),

                      child: Column(
                        children: [
                          inputField("Your Name", controller: nameController),
                          SizedBox(height: 15),

                          inputField("Your Email", controller: emailController),
                          SizedBox(height: 15),

                          inputField(
                            "Your Message",
                            maxLines: 5,
                            controller: messageController,
                          ),
                          SizedBox(height: 25),

                          // SEND BUTTON
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF5D6BFF),
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 5,
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Message Sent Successfully!",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  backgroundColor: Colors.green,
                                  behavior: SnackBarBehavior.floating,
                                  duration: Duration(seconds: 2),
                                  margin: EdgeInsets.all(18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              "Send Message",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Widget contactInfo({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Color(0xFF5D6BFF), size: 26),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 3),
            GestureDetector(
              onTap: () {
                if (icon == Icons.link || icon == Icons.code) {
                  openProjectUrl(value);
                } else if (icon == Icons.email) {
                  final Uri emailUri = Uri(scheme: 'mailto', path: value);
                  launchUrl(emailUri);
                } else if (icon == Icons.phone) {
                  final Uri phoneUri = Uri(scheme: 'tel', path: value);
                  launchUrl(phoneUri);
                }
              },
              child: Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.width * 0.023,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget contactInfoDesktop({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Color(0xFF5D6BFF), size: 26),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 3),
            GestureDetector(
              onTap: () {
                if (icon == Icons.link || icon == Icons.code) {
                  openProjectUrl(value);
                } else if (icon == Icons.email) {
                  final Uri emailUri = Uri(scheme: 'mailto', path: value);
                  launchUrl(emailUri);
                } else if (icon == Icons.phone) {
                  final Uri phoneUri = Uri(scheme: 'tel', path: value);
                  launchUrl(phoneUri);
                }
              },
              child: Text(
                value,
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black87),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget inputField(
    String hint, {
    int maxLines = 1,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Color(0xFF11182E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
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

  Widget _mobileNav(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
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
