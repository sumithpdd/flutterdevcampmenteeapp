import 'package:flutter/material.dart';

import '../models/sidebar_item.dart';
import '../utils/constants.dart';

class SidebarRow extends StatelessWidget {
  const SidebarRow({super.key, required this.item});

  final SidebarItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42.0,
          height: 42.0,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            gradient: item.background,
          ),
          child: item.icon,
        ),
        const SizedBox(width: 12),
        Text(
          item.title,
          style: kCalloutLabelStyle,
        ),
      ],
    );
  }
}
