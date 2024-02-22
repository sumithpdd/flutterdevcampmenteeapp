import 'package:flutter/material.dart';

import '../models/course.dart';
import '../utils/constants.dart';

class CourseSessionCard extends StatelessWidget {
  const CourseSessionCard({super.key, required this.session});
  final Session session;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(41.0),
          gradient: session.background,
          boxShadow: [
            BoxShadow(
              color: session.background.colors[0].withOpacity(0.3),
              blurRadius: 30.0,
              offset: const Offset(0, 20),
            ),
            BoxShadow(
              color: session.background.colors[1].withOpacity(0.3),
              blurRadius: 30.0,
              offset: const Offset(0, 20),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(41.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/illustrations/${session.illustration}',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            session.courseSubtitle,
                            style: kCardSubtitleStyle,
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            session.courseTitle,
                            style: kCardTitleStyle,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
