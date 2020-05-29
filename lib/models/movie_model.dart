class MovieListModel {
  List<MovieItemModel> movieItem;
  String totalResults;
  String response;

  MovieListModel({this.movieItem, this.totalResults, this.response});

  MovieListModel.fromJson(Map<String, dynamic> json) {
    if (json['Search'] != null) {
      movieItem = new List<MovieItemModel>();
      json['Search'].forEach((v) {
        movieItem.add(new MovieItemModel.fromJson(v));
      });
    }
    totalResults = json['totalResults'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movieItem != null) {
      data['Search'] = this.movieItem.map((v) => v.toJson()).toList();
    }
    data['totalResults'] = this.totalResults;
    data['Response'] = this.response;
    return data;
  }
}

class MovieItemModel {
  String title;
  String year;
  String imdbID;
  String type;
  String poster;

  MovieItemModel({this.title, this.year, this.imdbID, this.type, this.poster});

  MovieItemModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    imdbID = json['imdbID'];
    type = json['Type'];
    poster = json['Poster'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Year'] = this.year;
    data['imdbID'] = this.imdbID;
    data['Type'] = this.type;
    data['Poster'] = this.poster;
    return data;
  }
}
