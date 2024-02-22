import 'package:flutter/material.dart';

import '../models/course.dart';
import 'explore_course_card.dart';

class ExploreCourseList extends StatefulWidget {
  const ExploreCourseList({super.key});

  @override
  State<ExploreCourseList> createState() => _ExploreCourseListState();
}

class _ExploreCourseListState extends State<ExploreCourseList> {
  List<Course> courses = [];

  @override
  void initState() {
    super.initState();
    getCourses();
  }

  void getCourses() {
    courses = exploreCourses;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: exploreCourses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 10.0 : 0.0),
            child: ExploreCourseCard(course: exploreCourses[index]),
          );
        },
      ),
    );
  }
}
