import 'package:flutter/material.dart';

class MoviesScrollList extends StatelessWidget {
  final moviesList;
  final listTitle;
  final openMoviesListCallback;

  MoviesScrollList(
      {this.moviesList, this.listTitle, this.openMoviesListCallback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                listTitle,
                style: TextStyle(
                  fontFamily: 'Montesrrat Bold',
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: openMoviesListCallback,
                icon: Icon(
                  Icons.arrow_forward,
                  size: 18.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 250.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moviesList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2.0,
                      color: Colors.grey,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: moviesList[index],
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        width: 150.0,
                        height: 250.0,
                        fit: BoxFit.cover,
                        image: AssetImage(
                          moviesList[index],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
