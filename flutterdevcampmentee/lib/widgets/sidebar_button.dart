import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SidebarButton extends StatelessWidget {
  const SidebarButton({super.key, required this.triggerAnimation});
  final VoidCallback triggerAnimation;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: triggerAnimation,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: const BoxConstraints(
        maxWidth: 40.0,
        maxHeight: 40.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: const [
            BoxShadow(
              color: kShadowColor,
              offset: Offset(0, 12),
              blurRadius: 16.0,
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 14.0,
        ),
        child: Image.asset(
          'assets/icons/icon-sidebar.png',
          color: kPrimaryLabelColor,
        ),
      ),
    );
  }
}
