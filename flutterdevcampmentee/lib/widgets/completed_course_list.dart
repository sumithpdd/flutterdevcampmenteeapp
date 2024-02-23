import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/course.dart';
import 'continue_watching_card.dart';

class CompletedCoursesList extends StatefulWidget {
  const CompletedCoursesList({super.key});

  @override
  State<CompletedCoursesList> createState() => _CompletedCoursesListState();
}

class _CompletedCoursesListState extends State<CompletedCoursesList> {
  List<Container> indicators = [];
  int currentPage = 0;
  var completedCourses = [];
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    getCompletedCourses();
  }

  void getCompletedCourses() {
    _firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .get()
        .then((snapshot) {
      for (var course in snapshot["completed"]) {
        _firestore
            .collection("courses")
            .doc(course)
            .get()
            .then((courseSnapshot) {
          setState(() {
            completedCourses.add(Course(
              courseTitle: courseSnapshot["courseTitle"],
              courseSubtitle: courseSnapshot["courseSubtitle"],
              illustration: courseSnapshot["illustration"],
              logo: courseSnapshot["logo"],
              background: LinearGradient(colors: [
                Color(int.parse(courseSnapshot["color"][0])),
                Color(int.parse(courseSnapshot["color"][1])),
              ]),
              videoUrl: courseSnapshot["videoUrl"],
            ));
          });
        });
      }
    });
  }

  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: completedCourses.map((course) {
        var index = completedCourses.indexOf(course);
        return Container(
          width: 7.0,
          height: 7.0,
          margin: const EdgeInsets.symmetric(horizontal: 6.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPage == index
                  ? const Color(0xFF0971FE)
                  : const Color(0xFFA6AEBD)),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200.0,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return Opacity(
                opacity: currentPage == index ? 1.0 : 0.5,
                child: ContinueWatchingCard(
                  course: completedCourses[index],
                ),
              );
            },
            itemCount: completedCourses.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            controller: PageController(initialPage: 0, viewportFraction: 0.75),
          ),
        ),
        updateIndicators(),
      ],
    );
  }
}
