import 'package:flutter/material.dart';

import '../models/course.dart';
import '../utils/constants.dart';

class ExploreCourseCard extends StatefulWidget {
  const ExploreCourseCard({super.key, required this.course});
  final Course course;
  @override
  State<ExploreCourseCard> createState() => _ExploreCourseCardState();
}

class _ExploreCourseCardState extends State<ExploreCourseCard> {
  String? illustrationURL;
  @override
  void initState() {
    super.initState();
    getIllustration();
  }

  void getIllustration() {
    illustrationURL = 'assets/illustrations/${widget.course.illustration}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(41.0),
        child: Container(
          height: 130.0,
          width: 300.0,
          decoration: BoxDecoration(gradient: widget.course.background),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.course.courseSubtitle,
                        style: kCardSubtitleStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        widget.course.courseTitle,
                        style: kCardTitleStyle,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    (illustrationURL == null)
                        ? Container()
                        : Image.asset(
                            illustrationURL!,
                            fit: BoxFit.cover,
                            height: 100.0,
                          )
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
