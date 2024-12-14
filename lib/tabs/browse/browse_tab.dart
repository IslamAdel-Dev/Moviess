import 'package:flutter/material.dart';
import 'package:movies/api/api.dart';
import 'package:movies/appTheme.dart';
import 'package:movies/tabs/browse/movies_list.dart';
import 'package:movies/widgets/custom_browse.dart';
import 'package:movies/widgets/error_indicator.dart';
import 'package:movies/widgets/loading_indicator.dart';
/*import 'package:movies_app/api/api.dart';
import 'package:movies_app/app_theme.dart';
import 'package:movies_app/tabs/browse/movie_list_screen.dart';
import 'package:movies_app/widgets/custom_browser.dart';
import 'package:movies_app/widgets/error_indicator.dart';
import 'package:movies_app/widgets/loading_indicator.dart';*/

class BrowserTab extends StatelessWidget {
  const BrowserTab({super.key});
  static const String routeName = 'browser';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Browse Category',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppTheme.white,
                  ),
            ),
            const SizedBox(height: 10),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchGenres(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingIndicator();
                } else if (snapshot.hasError) {
                  return const ErrorIndicator();
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(
                      'No categories available',
                    ),
                  );
                }
                final genres = snapshot.data!;
                return Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: genres.length,
                    itemBuilder: (context, index) {
                      final genre = genres[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MoviesListScreen(
                                genreId: genre['id'],
                                genreName: genre['name'],
                              ),
                            ),
                          );
                        },
                        child: CustomBrowser(
                          title: genre['name'] ?? 'Unknown',
                          imageUrl: 'assets/images/action.png',
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
