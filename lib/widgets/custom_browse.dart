import 'package:flutter/material.dart';

class CustomBrowser extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CustomBrowser({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: 158,
              height: 90,
            ),
            Container(
              width: 158,
              height: 90,
              color: Colors.black.withOpacity(0.25),
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
