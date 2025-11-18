import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/View/contactusscreen.dart';
import 'package:personal_portfolio/View/experiencescreen.dart';
import 'package:personal_portfolio/View/projectscreen.dart';
import 'package:personal_portfolio/View/portfolio_page.dart';

class Skillscreen extends StatefulWidget {
  const Skillscreen({super.key});

  @override
  State<Skillscreen> createState() => _SkillscreenState();
}

class _SkillscreenState extends State<Skillscreen> {
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),

              // //////////////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _mobileNavBtn("Home", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PortfolioPage()),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _mobileNavBtn("Skill", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Skillscreen()),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _mobileNavBtn("Projects", () {
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _mobileNavBtn("Experience", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Experiencescreen()),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _mobileNavBtn("Contact", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Contactusscreen()),
                      );
                    }),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // //////////////////////////////////////////////////////
              Text(
                "Skills :-",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 20),
              _skillCardMobile(
                title: "Programming Languages",
                skills: ["Java", "Dart", "JavaScript", "SQL", "HTML5", "CSS3"],
              ),

              SizedBox(height: 15),

              _skillCardMobile(
                title: "Mobile & Desktop Development",
                skills: [
                  "Flutter",
                  "JavaFX",
                  "Responsive UI/UX",
                  "State Management",
                ],
              ),

              SizedBox(height: 15),

              _skillCardMobile(
                title: "Web Development",
                skills: ["React.js", "REST APIs", "Firebase Web"],
              ),

              SizedBox(height: 15),

              _skillCardMobile(
                title: "Backend & Cloud",
                skills: [
                  "Firebase Auth",
                  "Firestore",
                  "Node.js Basics",
                  "OpenAI APIs",
                ],
              ),

              SizedBox(height: 15),

              _skillCardMobile(
                title: "Databases",
                skills: ["Firestore", "MySQL (Basic)", "Cloud & Local Storage"],
              ),

              SizedBox(height: 15),

              _skillCardMobile(
                title: "Tools & Technologies",
                skills: ["Git", "GitHub", "Maven", "VS Code", "IntelliJ"],
              ),

              SizedBox(height: 15),

              _skillCardMobile(
                title: "Soft Skills",
                skills: [
                  "Problem Solving",
                  "Communication",
                  "Leadership",
                  "Team Work",
                ],
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

      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),

            // /////////////////////////////////////////////////////////////////////
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

            // //////////////////////////////////////////////////////////
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  "Skills :-",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // ///////////////////////////////////////////////////////////
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
              padding: EdgeInsets.all(35),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(25),
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _skillCard(
                        title: "Programming Languages",
                        skills: [
                          "Java",
                          "Dart",
                          "JavaScript",
                          "SQL",
                          "HTML5",
                          "CSS3",
                        ],
                      ),

                      _skillCard(
                        title: "Mobile & Desktop Development",
                        skills: [
                          "Flutter",
                          "JavaFX",
                          "Responsive UI/UX Design",
                          "State Management",
                        ],
                      ),

                      _skillCard(
                        title: "Web Development",
                        skills: [
                          "React.js",
                          "RESTful APIs",
                          "Firebase Hosting & Web Integrations",
                        ],
                      ),

                      _skillCard(
                        title: "Backend & Cloud",
                        skills: [
                          "Firebase (Auth, Firestore, Storage)",
                          "Node.js (Basic), CRUD APIs",
                          "OpenAI API Integration",
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _skillCard(
                        title: "Databases",
                        skills: [
                          "Firebase Firestore",
                          "MySQL (Basic)",
                          "Local & Cloud Storage",
                        ],
                      ),

                      _skillCard(
                        title: "Tools & Technologies",
                        skills: [
                          "Git & GitHub",
                          "Maven",
                          "Visual Studio Code",
                          "IntelliJ IDEA",
                        ],
                      ),

                      _skillCard(
                        title: "Soft Skills",
                        skills: [
                          "Problem-Solving",
                          "Collaboration",
                          "Leadership",
                          "Communication",
                        ],
                      ),
                    ],
                  ),
                ],
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),

              // //////////////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _mobileNavBtn("Home", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PortfolioPage()),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _mobileNavBtn("Skill", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Skillscreen()),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _mobileNavBtn("Projects", () {
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _mobileNavBtn("Experience", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Experiencescreen()),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _mobileNavBtn("Contact", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Contactusscreen()),
                      );
                    }),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // //////////////////////////////////////////////////////
              Text(
                "Skills :-",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 20),
              _skillCardMobile(
                title: "Programming Languages",
                skills: ["Java", "Dart", "JavaScript", "SQL", "HTML5", "CSS3"],
              ),

              SizedBox(height: 15),

              _skillCardMobile(
                title: "Mobile & Desktop Development",
                skills: [
                  "Flutter",
                  "JavaFX",
                  "Responsive UI/UX",
                  "State Management",
                ],
              ),

              SizedBox(height: 15),

              _skillCardMobile(
                title: "Web Development",
                skills: ["React.js", "REST APIs", "Firebase Web"],
              ),

              SizedBox(height: 15),

              _skillCardMobile(
                title: "Backend & Cloud",
                skills: [
                  "Firebase Auth",
                  "Firestore",
                  "Node.js Basics",
                  "OpenAI APIs",
                ],
              ),

              SizedBox(height: 15),

              _skillCardMobile(
                title: "Databases",
                skills: ["Firestore", "MySQL (Basic)", "Cloud & Local Storage"],
              ),

              SizedBox(height: 15),

              _skillCardMobile(
                title: "Tools & Technologies",
                skills: ["Git", "GitHub", "Maven", "VS Code", "IntelliJ"],
              ),

              SizedBox(height: 15),

              _skillCardMobile(
                title: "Soft Skills",
                skills: [
                  "Problem Solving",
                  "Communication",
                  "Leadership",
                  "Team Work",
                ],
              ),

              SizedBox(height: 40),
            ],
          ),
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

  Widget _mobileNavBtn(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
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

  Widget _skillCard({required String title, required List<String> skills}) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 6)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title :-",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          for (var skill in skills)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                "• $skill",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _skillCardMobile({
    required String title,
    required List<String> skills,
  }) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
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
          SizedBox(height: 10),
          ...skills.map(
            (s) => Padding(
              padding: EdgeInsets.only(bottom: 6),
              child: Text(
                "• $s",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
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
