import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final bool isSelected;
  final String text;
  final String assetPath;
  final VoidCallback
      onTap; // Ensure this is not nullable (remove the '?' if present)

  OptionTile({
    required this.isSelected,
    required this.text,
    required this.assetPath,
    required this.onTap, // Non-nullable
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Non-nullable onTap
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.015,
          horizontal: MediaQuery.of(context).size.width * 0.04,
        ),
        child: Row(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: isSelected ? Colors.green : Color(0xFFBFBFBF),
                shape: BoxShape.circle,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            Image.asset(
              assetPath,
              width: MediaQuery.of(context).size.width * 0.12,
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
