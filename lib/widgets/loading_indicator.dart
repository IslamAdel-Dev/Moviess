import 'package:flutter/material.dart';
import 'package:movies/appTheme.dart';
//import 'package:movies_app/app_theme.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppTheme.white,
      ),
    );
  }
}
