/// status : "ok"
/// status_message : "Query was successful"
/// data : {"movie":{"id":10,"url":"https://yts.mx/movies/13-2010","imdb_code":"tt0798817","title":"13","title_english":"13","title_long":"13 (2010)","slug":"13-2010","year":2010,"rating":6,"runtime":91,"genres":["Action","Crime","Drama","Thriller"],"like_count":73,"description_intro":"In Talbot, Ohio, a father's need for surgeries puts the family in a financial bind. His son Vince, an electrician, overhears a man talking about making a fortune in just a day. When the man overdoses on drugs, Vince finds instructions and a cell phone that the man has received and substitutes himself: taking a train to New York and awaiting contact. He has no idea what it's about. He ends up at a remote house where wealthy men bet on who will survive a complicated game of Russian roulette: he's number 13. In flashbacks we meet other contestants, including a man whose brother takes him out of a mental institution in order to compete. Can Vince be the last one standing?—","description_full":"In Talbot, Ohio, a father's need for surgeries puts the family in a financial bind. His son Vince, an electrician, overhears a man talking about making a fortune in just a day. When the man overdoses on drugs, Vince finds instructions and a cell phone that the man has received and substitutes himself: taking a train to New York and awaiting contact. He has no idea what it's about. He ends up at a remote house where wealthy men bet on who will survive a complicated game of Russian roulette: he's number 13. In flashbacks we meet other contestants, including a man whose brother takes him out of a mental institution in order to compete. Can Vince be the last one standing?—","yt_trailer_code":"Y41fFj-P4jI","language":"en","mpa_rating":"","background_image":"https://yts.mx/assets/images/movies/13_2010/background.jpg","background_image_original":"https://yts.mx/assets/images/movies/13_2010/background.jpg","small_cover_image":"https://yts.mx/assets/images/movies/13_2010/small-cover.jpg","medium_cover_image":"https://yts.mx/assets/images/movies/13_2010/medium-cover.jpg","large_cover_image":"https://yts.mx/assets/images/movies/13_2010/large-cover.jpg","medium_screenshot_image1":"https://yts.mx/assets/images/movies/13_2010/medium-screenshot1.jpg","medium_screenshot_image2":"https://yts.mx/assets/images/movies/13_2010/medium-screenshot2.jpg","medium_screenshot_image3":"https://yts.mx/assets/images/movies/13_2010/medium-screenshot3.jpg","large_screenshot_image1":"https://yts.mx/assets/images/movies/13_2010/large-screenshot1.jpg","large_screenshot_image2":"https://yts.mx/assets/images/movies/13_2010/large-screenshot2.jpg","large_screenshot_image3":"https://yts.mx/assets/images/movies/13_2010/large-screenshot3.jpg","cast":[{"name":"Alexander Skarsgård","character_name":"Jack","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0002907.jpg","imdb_code":"0002907"},{"name":"Jason Statham","character_name":"Jasper","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0005458.jpg","imdb_code":"0005458"},{"name":"Michael Shannon","character_name":"Henry","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0788335.jpg","imdb_code":"0788335"},{"name":"Emmanuelle Chriqui","character_name":"Aileen","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0004825.jpg","imdb_code":"0004825"}],"date_uploaded":"2015-10-31 20:46:37","date_uploaded_unix":1446320797}}

class MovieDetailsModel {
  MovieDetailsModel({
      this.status, 
      this.statusMessage, 
      this.data,});

  MovieDetailsModel.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? statusMessage;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_message'] = statusMessage;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// movie : {"id":10,"url":"https://yts.mx/movies/13-2010","imdb_code":"tt0798817","title":"13","title_english":"13","title_long":"13 (2010)","slug":"13-2010","year":2010,"rating":6,"runtime":91,"genres":["Action","Crime","Drama","Thriller"],"like_count":73,"description_intro":"In Talbot, Ohio, a father's need for surgeries puts the family in a financial bind. His son Vince, an electrician, overhears a man talking about making a fortune in just a day. When the man overdoses on drugs, Vince finds instructions and a cell phone that the man has received and substitutes himself: taking a train to New York and awaiting contact. He has no idea what it's about. He ends up at a remote house where wealthy men bet on who will survive a complicated game of Russian roulette: he's number 13. In flashbacks we meet other contestants, including a man whose brother takes him out of a mental institution in order to compete. Can Vince be the last one standing?—","description_full":"In Talbot, Ohio, a father's need for surgeries puts the family in a financial bind. His son Vince, an electrician, overhears a man talking about making a fortune in just a day. When the man overdoses on drugs, Vince finds instructions and a cell phone that the man has received and substitutes himself: taking a train to New York and awaiting contact. He has no idea what it's about. He ends up at a remote house where wealthy men bet on who will survive a complicated game of Russian roulette: he's number 13. In flashbacks we meet other contestants, including a man whose brother takes him out of a mental institution in order to compete. Can Vince be the last one standing?—","yt_trailer_code":"Y41fFj-P4jI","language":"en","mpa_rating":"","background_image":"https://yts.mx/assets/images/movies/13_2010/background.jpg","background_image_original":"https://yts.mx/assets/images/movies/13_2010/background.jpg","small_cover_image":"https://yts.mx/assets/images/movies/13_2010/small-cover.jpg","medium_cover_image":"https://yts.mx/assets/images/movies/13_2010/medium-cover.jpg","large_cover_image":"https://yts.mx/assets/images/movies/13_2010/large-cover.jpg","medium_screenshot_image1":"https://yts.mx/assets/images/movies/13_2010/medium-screenshot1.jpg","medium_screenshot_image2":"https://yts.mx/assets/images/movies/13_2010/medium-screenshot2.jpg","medium_screenshot_image3":"https://yts.mx/assets/images/movies/13_2010/medium-screenshot3.jpg","large_screenshot_image1":"https://yts.mx/assets/images/movies/13_2010/large-screenshot1.jpg","large_screenshot_image2":"https://yts.mx/assets/images/movies/13_2010/large-screenshot2.jpg","large_screenshot_image3":"https://yts.mx/assets/images/movies/13_2010/large-screenshot3.jpg","cast":[{"name":"Alexander Skarsgård","character_name":"Jack","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0002907.jpg","imdb_code":"0002907"},{"name":"Jason Statham","character_name":"Jasper","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0005458.jpg","imdb_code":"0005458"},{"name":"Michael Shannon","character_name":"Henry","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0788335.jpg","imdb_code":"0788335"},{"name":"Emmanuelle Chriqui","character_name":"Aileen","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0004825.jpg","imdb_code":"0004825"}],"date_uploaded":"2015-10-31 20:46:37","date_uploaded_unix":1446320797}

class Data {
  Data({
      this.movie,});

  Data.fromJson(dynamic json) {
    movie = json['movie'] != null ? Movie.fromJson(json['movie']) : null;
  }
  Movie? movie;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (movie != null) {
      map['movie'] = movie?.toJson();
    }
    return map;
  }

}

/// id : 10
/// url : "https://yts.mx/movies/13-2010"
/// imdb_code : "tt0798817"
/// title : "13"
/// title_english : "13"
/// title_long : "13 (2010)"
/// slug : "13-2010"
/// year : 2010
/// rating : 6
/// runtime : 91
/// genres : ["Action","Crime","Drama","Thriller"]
/// like_count : 73
/// description_intro : "In Talbot, Ohio, a father's need for surgeries puts the family in a financial bind. His son Vince, an electrician, overhears a man talking about making a fortune in just a day. When the man overdoses on drugs, Vince finds instructions and a cell phone that the man has received and substitutes himself: taking a train to New York and awaiting contact. He has no idea what it's about. He ends up at a remote house where wealthy men bet on who will survive a complicated game of Russian roulette: he's number 13. In flashbacks we meet other contestants, including a man whose brother takes him out of a mental institution in order to compete. Can Vince be the last one standing?—"
/// description_full : "In Talbot, Ohio, a father's need for surgeries puts the family in a financial bind. His son Vince, an electrician, overhears a man talking about making a fortune in just a day. When the man overdoses on drugs, Vince finds instructions and a cell phone that the man has received and substitutes himself: taking a train to New York and awaiting contact. He has no idea what it's about. He ends up at a remote house where wealthy men bet on who will survive a complicated game of Russian roulette: he's number 13. In flashbacks we meet other contestants, including a man whose brother takes him out of a mental institution in order to compete. Can Vince be the last one standing?—"
/// yt_trailer_code : "Y41fFj-P4jI"
/// language : "en"
/// mpa_rating : ""
/// background_image : "https://yts.mx/assets/images/movies/13_2010/background.jpg"
/// background_image_original : "https://yts.mx/assets/images/movies/13_2010/background.jpg"
/// small_cover_image : "https://yts.mx/assets/images/movies/13_2010/small-cover.jpg"
/// medium_cover_image : "https://yts.mx/assets/images/movies/13_2010/medium-cover.jpg"
/// large_cover_image : "https://yts.mx/assets/images/movies/13_2010/large-cover.jpg"
/// medium_screenshot_image1 : "https://yts.mx/assets/images/movies/13_2010/medium-screenshot1.jpg"
/// medium_screenshot_image2 : "https://yts.mx/assets/images/movies/13_2010/medium-screenshot2.jpg"
/// medium_screenshot_image3 : "https://yts.mx/assets/images/movies/13_2010/medium-screenshot3.jpg"
/// large_screenshot_image1 : "https://yts.mx/assets/images/movies/13_2010/large-screenshot1.jpg"
/// large_screenshot_image2 : "https://yts.mx/assets/images/movies/13_2010/large-screenshot2.jpg"
/// large_screenshot_image3 : "https://yts.mx/assets/images/movies/13_2010/large-screenshot3.jpg"
/// cast : [{"name":"Alexander Skarsgård","character_name":"Jack","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0002907.jpg","imdb_code":"0002907"},{"name":"Jason Statham","character_name":"Jasper","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0005458.jpg","imdb_code":"0005458"},{"name":"Michael Shannon","character_name":"Henry","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0788335.jpg","imdb_code":"0788335"},{"name":"Emmanuelle Chriqui","character_name":"Aileen","url_small_image":"https://yts.mx/assets/images/actors/thumb/nm0004825.jpg","imdb_code":"0004825"}]
/// date_uploaded : "2015-10-31 20:46:37"
/// date_uploaded_unix : 1446320797

class Movie {
  Movie({
      this.id, 
      this.url, 
      this.imdbCode, 
      this.title, 
      this.titleEnglish, 
      this.titleLong, 
      this.slug, 
      this.year, 
      this.rating, 
      this.runtime, 
      this.genres, 
      this.likeCount, 
      this.descriptionIntro, 
      this.descriptionFull, 
      this.ytTrailerCode, 
      this.language, 
      this.mpaRating, 
      this.backgroundImage, 
      this.backgroundImageOriginal, 
      this.smallCoverImage, 
      this.mediumCoverImage, 
      this.largeCoverImage, 
      this.mediumScreenshotImage1, 
      this.mediumScreenshotImage2, 
      this.mediumScreenshotImage3, 
      this.largeScreenshotImage1, 
      this.largeScreenshotImage2, 
      this.largeScreenshotImage3, 
      this.cast, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  Movie.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    rating = json['rating']?.toDouble();
    runtime = json['runtime'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    likeCount = json['like_count'];
    descriptionIntro = json['description_intro'];
    descriptionFull = json['description_full'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    mediumScreenshotImage1 = json['medium_screenshot_image1'];
    mediumScreenshotImage2 = json['medium_screenshot_image2'];
    mediumScreenshotImage3 = json['medium_screenshot_image3'];
    largeScreenshotImage1 = json['large_screenshot_image1'];
    largeScreenshotImage2 = json['large_screenshot_image2'];
    largeScreenshotImage3 = json['large_screenshot_image3'];
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast?.add(Cast.fromJson(v));
      });
    }
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  int? likeCount;
  String? descriptionIntro;
  String? descriptionFull;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? mediumScreenshotImage1;
  String? mediumScreenshotImage2;
  String? mediumScreenshotImage3;
  String? largeScreenshotImage1;
  String? largeScreenshotImage2;
  String? largeScreenshotImage3;
  List<Cast>? cast;
  String? dateUploaded;
  int? dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['imdb_code'] = imdbCode;
    map['title'] = title;
    map['title_english'] = titleEnglish;
    map['title_long'] = titleLong;
    map['slug'] = slug;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['like_count'] = likeCount;
    map['description_intro'] = descriptionIntro;
    map['description_full'] = descriptionFull;
    map['yt_trailer_code'] = ytTrailerCode;
    map['language'] = language;
    map['mpa_rating'] = mpaRating;
    map['background_image'] = backgroundImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['small_cover_image'] = smallCoverImage;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    map['medium_screenshot_image1'] = mediumScreenshotImage1;
    map['medium_screenshot_image2'] = mediumScreenshotImage2;
    map['medium_screenshot_image3'] = mediumScreenshotImage3;
    map['large_screenshot_image1'] = largeScreenshotImage1;
    map['large_screenshot_image2'] = largeScreenshotImage2;
    map['large_screenshot_image3'] = largeScreenshotImage3;
    if (cast != null) {
      map['cast'] = cast?.map((v) => v.toJson()).toList();
    }
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

}

/// name : "Alexander Skarsgård"
/// character_name : "Jack"
/// url_small_image : "https://yts.mx/assets/images/actors/thumb/nm0002907.jpg"
/// imdb_code : "0002907"

class Cast {
  Cast({
      this.name, 
      this.characterName, 
      this.urlSmallImage, 
      this.imdbCode,});

  Cast.fromJson(dynamic json) {
    name = json['name'];
    characterName = json['character_name'];
    urlSmallImage = json['url_small_image'];
    imdbCode = json['imdb_code'];
  }
  String? name;
  String? characterName;
  String? urlSmallImage;
  String? imdbCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['character_name'] = characterName;
    map['url_small_image'] = urlSmallImage;
    map['imdb_code'] = imdbCode;
    return map;
  }

}