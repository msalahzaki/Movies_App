class FavoriteResponse {
  FavoriteResponse({
      this.message,
    this.error,
    this.statusCode,
      this.data,});

  FavoriteResponse.fromJson(dynamic json) {
    message = json['message'];
    error = json['error'];
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(FavoriteMove.fromJson(v));
      });
    }
  }
  String? message;
  List<FavoriteMove>? data;
  String? error;
  int? statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class FavoriteMove {
  FavoriteMove({
      this.movieId, 
      this.name, 
      this.rating, 
      this.imageURL, 
      this.year,});

  FavoriteMove.fromJson(dynamic json) {
    movieId = json['movieId'];
    name = json['name'];
    rating = json['rating'];
    imageURL = json['imageURL'];
    year = json['year'];
  }
  String? movieId;
  String? name;
  num? rating;
  String? imageURL;
  String? year;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movieId'] = movieId;
    map['name'] = name;
    map['rating'] = rating;
    map['imageURL'] = imageURL;
    map['year'] = year;
    return map;
  }

}