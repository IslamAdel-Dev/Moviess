import 'package:flutter/material.dart';
import 'package:movies/appTheme.dart';
//import 'package:movies_app/app_theme.dart';

class CustomWatchlist extends StatelessWidget {
  const CustomWatchlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          color: AppTheme.darkBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/watchlist.png',
                        width: 140,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppTheme.goldenYellow,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8,
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alita Battle Angel',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.white,
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '2019',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppTheme.white.withOpacity(0.6745),
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Rosa Salazar, Christoph Waltz',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppTheme.white.withOpacity(0.6745),
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30,
          width: 358,
          child: Divider(
            color: AppTheme.grey70,
            thickness: 1,
          ),
        )
      ],
    );
  }
}
