import 'package:flutter/material.dart';
import 'package:grams_porto/style.dart';
import 'package:universal_html/html.dart' as html;

class InfoButton extends StatelessWidget {
  const InfoButton({
    super.key,
    required this.pHeight,
    required this.pWidth,
  });

  final double pHeight;
  final double pWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Tooltip(
          message: "Anything in green is an actionable region",
          child: IconButton(
            icon: const Icon(Icons.info),
            onPressed: () => showAboutDialog(
              applicationName: "Graham J. Joss Portfolio",
              applicationVersion: "0.0.1",
              applicationLegalese: "© 2024 Graham J. Joss",
              barrierLabel: "About this",
              barrierDismissible: true,
              barrierColor: Colors.black.withOpacity(0.8),
              context: context,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 6,
                        color: startScreenButton,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9),
                      child: Container(
                        color: pastelPurp,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: startScreenBackgroundColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      height: pHeight * (3 / 4),
                                      width: pWidth * (3 / 4),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 12,
                                            blurRadius: 15,
                                            offset: const Offset(4,
                                                4), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        'assets/images/pro_pic2.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    color: matte,
                                    child: const Column(
                                      children: [
                                        Text(
                                          "This is a portfolio website for Graham J. Joss.",
                                          style: TextStyle(fontSize: 24),
                                        ),
                                        Text(
                                          "It is built with Flutter, and is a work in progress",
                                          style: TextStyle(fontSize: 24),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        color: matte,
                                        child: const Text(
                                          "The source code is available at ",
                                          style: TextStyle(
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        child: GestureDetector(
                                          onTap: () {
                                            final anchor = html.AnchorElement(
                                              href:
                                                  'https://github.com/gramjos/tour_co',
                                            )..setAttribute('target', '_blank');
                                            html.document.body!.children
                                                .add(anchor);
                                            anchor.click();
                                            html.document.body!.children
                                                .remove(anchor);
                                          },
                                          child: const Text(
                                            "here",
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.blue,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
