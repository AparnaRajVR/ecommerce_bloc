
import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool isLogout;
  final VoidCallback? onTap;

  const ProfileContainer({
    super.key,
    required this.title,
    this.icon,
    this.isLogout = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isLogout ? Colors.black : Colors.grey[200],
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        height: 70,
        width: 390,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 28,
                color: isLogout ? Colors.white : Colors.black,
              ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: isLogout ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
