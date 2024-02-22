import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/course_sessions_list.dart';

class CourseSessionsScreen extends StatelessWidget {
  const CourseSessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(32.0),
            decoration: const BoxDecoration(
              color: kCardPopupBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34.0),
                bottomLeft: Radius.circular(34.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 12),
                  blurRadius: 32.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Course Sessions",
                  style: kTitle2Style,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  "12 sections",
                  style: kSubtitleStyle,
                ),
              ],
            ),
          ),
          const CourseSessionList(),
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}
