import 'package:dio/dio.dart' show Dio;
import 'package:retrofit/dio.dart' show HttpResponse;
import 'package:retrofit/http.dart' show GET, Query, RestApi;

import 'search_movie_result_dto.dart';

part 'tmdb_api.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class TmdbApi {
  factory TmdbApi(Dio dio, {String baseUrl}) = _TmdbApi;

  factory TmdbApi.client({String baseUrl}) {
    final dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Accept"] = "application/vnd.app.v2+json";

    return TmdbApi(dio, baseUrl: baseUrl);
  }

  @GET("search/movie")
  Future<HttpResponse<SearchMovieResultDto>> searchMovie(@Query("query") String query, {@Query("api_key") String apiKey = "b6478e653ba139e842e0b31dee49fdbe"});
}

