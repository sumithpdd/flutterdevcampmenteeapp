import 'package:flutter/material.dart';

import '../models/course.dart';
import '../utils/constants.dart';
import 'course_session_card.dart';

class CourseSessionList extends StatelessWidget {
  const CourseSessionList({super.key});

  List<Widget> courseSessionsWidgets() {
    List<Widget> cards = [];
    for (var session in courseSessions) {
      cards.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: CourseSessionCard(
            session: session,
          ),
        ),
      );
    }
    cards.add(
      Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Text(
          "No more Sessions to view, look\nfor more in our courses",
          style: kCaptionLabelStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: courseSessionsWidgets(),
      ),
    );
  }
}
