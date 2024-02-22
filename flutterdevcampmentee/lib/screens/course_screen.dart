import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../models/course.dart';
import '../utils/constants.dart';
import 'course_sessions_screen.dart';
import 'video_player_screen.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key, required this.course});
  final Course course;
  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  late PanelController panelController;
  Widget indicators() {
    List<Widget> indicators = [];
    for (var i = 0; i < 9; i++) {
      indicators.add(Container(
        width: 7.0,
        height: 7.0,
        margin: const EdgeInsets.symmetric(horizontal: 6.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == 0 ? const Color(0xFF0971FE) : const Color(0xFFA6AEBD)),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }

  @override
  void initState() {
    super.initState();
    panelController = PanelController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: kBackgroundColor,
            child: SlidingUpPanel(
              controller: panelController,
              backdropEnabled: true,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(34.0),
              ),
              color: kCardPopupBackgroundColor,
              boxShadow: const [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, -12),
                  blurRadius: 32.0,
                )
              ],
              minHeight: 0.0,
              maxHeight: MediaQuery.of(context).size.height * 0.95,
              panel: const CourseSessionsScreen(),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      // overflow: Overflow.clip,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                                gradient: widget.course.background),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: SafeArea(
                            bottom: false,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10.0),
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          child: Hero(
                                            tag:
                                                "course_${widget.course.id}_${widget.course.logo}_${widget.course.illustration}",
                                            child: Image.asset(
                                              'assets/logos/${widget.course.logo}',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20.0,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Hero(
                                                tag:
                                                    "course_${widget.course.id}_${widget.course.courseSubtitle}_${widget.course.illustration}",
                                                child: Text(
                                                  widget.course.courseSubtitle,
                                                  style:
                                                      kSecondaryCalloutLabelStyle
                                                          .copyWith(
                                                              color: Colors
                                                                  .white70),
                                                ),
                                              ),
                                              Hero(
                                                tag:
                                                    "course_${widget.course.id}_${widget.course.courseTitle}_${widget.course.illustration}",
                                                child: Text(
                                                  widget.course.courseTitle,
                                                  style:
                                                      kLargeTitleStyle.copyWith(
                                                          color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => Navigator.pop(context),
                                          child: Container(
                                              width: 36.0,
                                              height: 36.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                color: kPrimaryLabelColor
                                                    .withOpacity(0.8),
                                              ),
                                              child: const Icon(Icons.close,
                                                  color: Colors.white)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 28.0,
                                  ),
                                  Expanded(
                                    child: Hero(
                                      tag:
                                          "course_image_${widget.course.id}_${widget.course.courseTitle}_${widget.course.illustration}",
                                      child: Image.asset(
                                        'assets/illustrations/${widget.course.illustration}',
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //Play Button
                        Padding(
                          padding: const EdgeInsets.only(right: 28.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      VideoPlayerScreen(
                                    videoId: widget.course.videoUrl,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                top: 12.5,
                                bottom: 13.5,
                                left: 20.5,
                                right: 14.5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: kShadowColor,
                                    blurRadius: 16.0,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              width: 60.0,
                              height: 60.0,
                              child: Image.asset('assets/icons/icon-play.png'),
                            ),
                          ),
                        )
                      ],
                    ),

                    //Build the Students Infographic
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        left: 28.0,
                        right: 28.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 58.0,
                                width: 58.0,
                                decoration: BoxDecoration(
                                  gradient: widget.course.background,
                                  borderRadius: BorderRadius.circular(29.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                      color: kBackgroundColor,
                                      borderRadius: BorderRadius.circular(29.0),
                                    ),
                                    child: CircleAvatar(
                                      radius: 21.0,
                                      backgroundColor: kCourseElementIconColor,
                                      child: Icon(
                                        Platform.isAndroid
                                            ? Icons.people
                                            : CupertinoIcons.group_solid,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "105",
                                    style: kTitle2Style,
                                  ),
                                  Text(
                                    "Students",
                                    style: kSearchPlaceholderStyle,
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 58.0,
                                width: 58.0,
                                decoration: BoxDecoration(
                                  gradient: widget.course.background,
                                  borderRadius: BorderRadius.circular(29.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                      color: kBackgroundColor,
                                      borderRadius: BorderRadius.circular(29.0),
                                    ),
                                    child: CircleAvatar(
                                      radius: 21.0,
                                      backgroundColor: kCourseElementIconColor,
                                      child: Icon(
                                        Platform.isAndroid
                                            ? Icons.format_quote
                                            : CupertinoIcons.news_solid,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "1k",
                                    style: kTitle2Style,
                                  ),
                                  Text(
                                    "Comments",
                                    style: kSearchPlaceholderStyle,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28.0, vertical: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          indicators(),
                          GestureDetector(
                            onTap: () {
                              panelController.open();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: kShadowColor,
                                    offset: Offset(0, 12),
                                    blurRadius: 16.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              width: 80.0,
                              height: 40.0,
                              child: Text(
                                "View all",
                                style: kSearchTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            """Flutter transforms the development process. Build, test, and deploy beautiful mobile, web, desktop, and embedded experiences from a single codebase.""",
                            style: kBodyLabelStyle,
                          ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          Text(
                            "About this course",
                            style: kTitle1Style,
                          ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          Text(
                            """This course is 9 week program which covers Basic Flutter concepts
Learn from experts ,Assignments & capstone projects!""",
                            style: kBodyLabelStyle,
                          ),
                          const SizedBox(height: 24.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
