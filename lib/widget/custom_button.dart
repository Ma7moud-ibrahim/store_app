import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 800,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.black,
          iconSize: 25,
          // أضفنا padding داخلي عشان الأيقونة متلزقش في الحافة بالظبط
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            const SizedBox(width: 25),

            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),

            const Icon(Icons.shopping_bag, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
