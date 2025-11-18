import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/View/contactusscreen.dart';
import 'package:personal_portfolio/View/portfolio_page.dart';
import 'package:personal_portfolio/View/projectscreen.dart';
import 'package:personal_portfolio/View/skillscreen.dart';

class Experiencescreen extends StatefulWidget {
  const Experiencescreen({super.key});

  @override
  State<Experiencescreen> createState() => _ExperiencescreenState();
}

class _ExperiencescreenState extends State<Experiencescreen> {
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
              // /////////////////////////////////
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
                  Expanded(child: _mobileNav("Experience", () {})),
                  SizedBox(width: 10),
                  Expanded(
                    child: _mobileNav("Contact", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Contactusscreen()),
                      );
                    }),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // //////////////////////
              Text(
                "Internship Experience :-",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 25),

              // ////////////////////////////////////////////////////////
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.45),
                  borderRadius: BorderRadius.circular(22),
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
                    Center(
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          techLogo("assets/logo/flutter.png"),
                          techLogo("assets/logo/java.png"),
                          techLogo("assets/logo/react.png"),
                          techLogo("assets/logo/firebase.jpeg"),
                          techLogo("assets/logo/sql.png"),
                          techLogo("assets/logo/node.png"),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),

                    experienceCard(
                      company: "Incubators (Core2Web), Pune",
                      role: "Flutter Developer Intern",
                      duration: "Feb 2025 – Oct 2025",
                      responsibilities: [
                        "Developed cross-platform mobile apps using Flutter (Dart).",
                        "Built responsive and reusable UI screens.",
                        "Integrated Firebase Authentication and Firestore.",
                        "Implemented CRUD operations & backend validation.",
                        "Collaborated on API design and data handling.",
                        "Used Git, Agile workflow & team collaboration.",
                      ],
                    ),

                    SizedBox(height: 25),

                    experienceCard(
                      company: "Market Research Future, Pune",
                      role: "Frontend Developer Intern",
                      duration: "May 2024 – Aug 2024",
                      responsibilities: [
                        "Developed web interfaces using React.js.",
                        "Used Redux for scalable state management.",
                        "Integrated REST APIs for dynamic data.",
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),
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
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  "Internship Experience :-",
                  style: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              SizedBox(height: 60),

              // //////////////////////
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.92,
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 25),
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
                      SizedBox(width: 20),
                      // //////////////////////////////////////////////////////////
                      Container(
                        padding: EdgeInsets.all(40),
                        child: Column(
                          children: [
                            Wrap(
                              spacing: 35,
                              runSpacing: 30,
                              children: [
                                techLogo("assets/logo/flutter.png"),
                                techLogo("assets/logo/java.png"),
                                techLogo("assets/logo/react.png"),
                              ],
                            ),
                            SizedBox(height: 40),
                            Wrap(
                              spacing: 35,
                              runSpacing: 30,
                              children: [
                                techLogo("assets/logo/firebase.jpeg"),
                                techLogo("assets/logo/sql.png"),
                                techLogo("assets/logo/node.png"),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 160),

                      // ////////////////////////////////////////////////////////////
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            experienceCard(
                              company: "Incubators (Core2Web), Pune",
                              role: "Flutter Developer Intern",
                              duration: "Feb 2025 – Oct 2025",
                              responsibilities: [
                                "Developed cross-platform mobile apps using Flutter (Dart).",
                                "Built responsive and reusable UI screens using modern layouts.",
                                "Integrated Firebase Authentication and Firestore for secure login & real-time data.",
                                "Implemented CRUD operations and backend validation.",
                                "Collaborated on backend tasks including APIs, validation, and data handling.",
                                "Worked on Git version control, Agile development, and team collaboration.",
                              ],
                            ),

                            SizedBox(height: 30),

                            experienceCard(
                              company: "Market Research Future, Pune",
                              role: "Frontend Developer Intern",
                              duration: "May 2024 – Aug 2024",
                              responsibilities: [
                                "Developed web interfaces using React.js & JavaScript.",
                                "Used Redux for state management and scalable UI architecture.",
                                "Integrated REST APIs to display dynamic data efficiently.",
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 40),
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
              // /////////////////////////////////
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
                  Expanded(child: _mobileNav("Experience", () {})),
                  SizedBox(width: 10),
                  Expanded(
                    child: _mobileNav("Contact", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Contactusscreen()),
                      );
                    }),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // //////////////////////
              Text(
                "Internship Experience :-",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 25),

              // ////////////////////////////////////////////////////////
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.45),
                  borderRadius: BorderRadius.circular(22),
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
                    Center(
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          techLogo("assets/logo/flutter.png"),
                          techLogo("assets/logo/java.png"),
                          techLogo("assets/logo/react.png"),
                          techLogo("assets/logo/firebase.jpeg"),
                          techLogo("assets/logo/sql.png"),
                          techLogo("assets/logo/node.png"),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),

                    experienceCard(
                      company: "Incubators (Core2Web), Pune",
                      role: "Flutter Developer Intern",
                      duration: "Feb 2025 – Oct 2025",
                      responsibilities: [
                        "Developed cross-platform mobile apps using Flutter (Dart).",
                        "Built responsive and reusable UI screens.",
                        "Integrated Firebase Authentication and Firestore.",
                        "Implemented CRUD operations & backend validation.",
                        "Collaborated on API design and data handling.",
                        "Used Git, Agile workflow & team collaboration.",
                      ],
                    ),

                    SizedBox(height: 25),

                    experienceCard(
                      company: "Market Research Future, Pune",
                      role: "Frontend Developer Intern",
                      duration: "May 2024 – Aug 2024",
                      responsibilities: [
                        "Developed web interfaces using React.js.",
                        "Used Redux for scalable state management.",
                        "Integrated REST APIs for dynamic data.",
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget techLogo(String path) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Image.asset(path, width: 60),
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

  Widget experienceCard({
    required String company,
    required String role,
    required String duration,
    required List<String> responsibilities,
  }) {
    return Container(
      padding: EdgeInsets.all(22),
      margin: EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.65),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
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
          // Title
          Text(
            role,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 6),

          // Company + Duration
          Text(
            "$company | $duration",
            style: GoogleFonts.poppins(fontSize: 15, color: Colors.black54),
          ),

          SizedBox(height: 15),

          // Responsibilities
          ...responsibilities.map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: 6),
              child: Text(
                "• $item",
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black87),
              ),
            ),
          ),
        ],
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
