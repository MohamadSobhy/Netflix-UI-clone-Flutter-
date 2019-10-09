import 'package:flutter/material.dart';
import 'package:netflix_clone_app/src/models/movie_model.dart';
import 'package:netflix_clone_app/src/screens/movie_details_screen.dart';

import '../screens/movie_details_screen.dart';

class MovieSelectorCard extends StatelessWidget {
  final Movie currentMovie;
  final PageController _pageController;
  final int index;

  MovieSelectorCard(this.currentMovie, this._pageController, this.index);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget child) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.4)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 300.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return MovieDetailsScreen(currentMovie);
              },
            ),
          );
        },
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: currentMovie.imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(
                          currentMovie.imageUrl,
                        ),
                        height: 220.0,
                        width: 400.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 25.0,
              bottom: 30.0,
              child: Container(
                width: 250.0,
                child: Text(
                  currentMovie.title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Montserrat Bold',
                    fontWeight: FontWeight.bold,
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
