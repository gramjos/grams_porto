import 'package:grams_porto/screens/home/info_button.dart';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:grams_porto/app.dart';
import 'package:grams_porto/scoped_models/scoped_like_count.dart';
import 'package:grams_porto/screens/home/dynamic_liking.dart';
import 'package:grams_porto/screens/home/platform_info.dart';
import 'package:grams_porto/style.dart';

class StartPage extends StatelessWidget {
  StartPage({super.key});

  final ScopedLikeCount likeCounter = ScopedLikeCount();

  @override
  Widget build(BuildContext context) {
    // Check the platform
    Map<String, dynamic> platformInfo = PlatformInfo.getPlatformInfo(context);
    String platform = platformInfo['platform'];
    double pWidth = platformInfo['pWidth'];
    double pHeight = platformInfo['pHeight'];
    double pFontSize = platformInfo['pFontSize'];

    var scaffold = Scaffold(
      backgroundColor: startScreenBackgroundColor,
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/supinski_square.png',
          height: 24,
          width: 24,
        ),
        actions: [
          InfoButton(pHeight: pHeight, pWidth: pWidth),
        ],
        backgroundColor: matte,
        centerTitle: true,
        title: Text(
          'Graham J. Joss',
          style: titleSignature(pFontSize),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 9,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 9,
                ),
                Column(
                  children: [
                    MouseRegion(
                      onEnter: (PointerEnterEvent event) {
                        final logger = Logger();
                        logger.d("logging here");
                        likeCounter.toggle();
                      },
                      onExit: (PointerExitEvent event) {
                        final logger = Logger();
                        logger.d("logging here");
                        likeCounter.toggle();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          // add border
                          border: Border.all(
                            width: 19,
                            color: startScreenButton,
                          ),
                          // set border radius
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Image.asset(
                          'assets/images/pro_pic.jpg',
                          height: pHeight,
                          width: pWidth,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 9,
                      ),
                      Container(
                        color: matte,
                        padding: const EdgeInsets.all(8.0),
                        child: const Column(
                          children: [
                            Text(
                              "Welcome to my portfolio!",
                              style: TextStyle(fontSize: 24),
                            ),
                            Text(
                              "I am a knowledge seeker with an insatiable curiosity.",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: startScreenButton,
                          foregroundColor: Cols.black,
                        ),
                        onPressed: () {
                          _passResume(context, likeCounter.lc.likeCT);
                        },
                        child: const Tooltip(
                          message: "View my professional documents",
                          child: Text('Resume and Cover Letter'),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: startScreenButton,
                          foregroundColor: Cols.black,
                        ),
                        onPressed: () {
                          _passLikes(context, likeCounter.lc.likeCT);
                        },
                        child: const Tooltip(
                          message: "Technical projects",
                          child: Text('Mathematics and Computation Projects'),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: startScreenButton,
                          foregroundColor: Cols.black,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, artRoute);
                        },
                        child: const Tooltip(
                          message: "Art never dies",
                          child: Text('Art'),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: startScreenButton,
                          foregroundColor: Cols.black,
                        ),
                        onPressed: () {
                          _passTestLikes(context, likeCounter.lc.likeCT);
                        },
                        child: const Tooltip(
                          message: "TDD",
                          child: Text('testing'),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                  height: 15,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                width: double.infinity, // Expand the container to full width
                color: matte,
                child: Column(
                  children: [
                    Text(platform),
                    const Tooltip(
                      message:
                          "Hover over my picture or press the heart\n to see this area change",
                      child: DynamicLiking(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: startScreenButton,
        tooltip: "Spread Love",
        child: const Icon(
          Icons.favorite_outline_sharp,
          color: Cols.heartOutline,
        ),
        onPressed: () {
          pressButton();
          likeCounter.increment();
        },
      ),
    );
    return ScopedModel<ScopedLikeCount>(
      model: likeCounter,
      child: scaffold,
    );
  }

  void _passResume(BuildContext context, int likes) {
    Navigator.pushNamed(context, resumeRoute, arguments: {"likes": likes});
  }

  void _passLikes(BuildContext context, int likes) {
    Navigator.pushNamed(context, mathCompRoute, arguments: {"likes": likes});
  }

  void _passTestLikes(BuildContext context, int likes) {
    Navigator.pushNamed(context, testRoute, arguments: {"likes": likes});
  }

  void pressButton() {
    final logger = Logger();

    logger.d("activated the button :)");
  }
}