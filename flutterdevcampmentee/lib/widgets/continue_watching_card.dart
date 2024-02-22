import 'package:flutter/material.dart';

import '../models/course.dart';
import '../utils/constants.dart';

class ContinueWatchingCard extends StatelessWidget {
  const ContinueWatchingCard({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              right: 20.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: course.background,
                borderRadius: BorderRadius.circular(41.0),
                boxShadow: [
                  BoxShadow(
                      color: course.background.colors[0].withOpacity(0.3),
                      offset: const Offset(0, 20),
                      blurRadius: 20.0),
                  BoxShadow(
                      color: course.background.colors[1].withOpacity(0.3),
                      offset: const Offset(0, 20),
                      blurRadius: 20.0)
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(41.0),
                child: SizedBox(
                  height: 160.0,
                  width: 280.0,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/illustrations/${course.illustration}',
                                fit: BoxFit.cover,
                                height: 110,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course.courseSubtitle,
                              style: kCardSubtitleStyle,
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              course.courseTitle,
                              style: kCardTitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18.0),
              boxShadow: const [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 4),
                  blurRadius: 16.0,
                ),
              ],
            ),
            padding: const EdgeInsets.only(
              top: 12.5,
              bottom: 13.5,
              left: 20.5,
              right: 14.5,
            ),
            child: Image.asset('assets/icons/icon-play.png'),
          ),
        ],
      ),
    );
  }
}
