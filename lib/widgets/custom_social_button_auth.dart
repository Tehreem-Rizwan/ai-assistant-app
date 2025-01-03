import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String asset;
  final VoidCallback onTap; // Define the onTap callback

  SocialButton(
      {required this.asset,
      required this.onTap}); // Assign onTap in constructor

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Assign the onTap callback here
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey, // Replace with klightgreyColor if needed
            width: 1,
          ),
        ),
        padding: EdgeInsets.all(8),
        child: Image.asset(
          asset,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
