import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_peek/domain/model/api_result.dart';
import 'package:movie_peek/domain/model/movie.dart';
import 'package:movie_peek/domain/model/movie_list.dart';
import 'package:movie_peek/domain/repository/movie_repository.dart';
import 'package:movie_peek/domain/usecase/movie_use_case.dart';

@GenerateMocks([MovieRepository])
import 'movie_use_case_test.mocks.dart';

void main() {
  late MovieUseCase useCase;
  late MockMovieRepository mockRepository;

  setUp(() {
    mockRepository = MockMovieRepository();
    useCase = MovieUseCase(mockRepository);
  });

  test('getPopularMovies 호출 시 Success<MovieList> 리턴 여부 확인', () async {
    // Given: 초기 설정
    final testPage = 1;
    final movieList = MovieList(movies: [Movie(id: 1, title: 'Test Movie', posterPath: '/test.jpg')]);
    final emptyList = MovieList(movies: []);
    final expectedResult = Success<MovieList>(movieList);

    // When: getPopularMovies 호출 시
    provideDummy<ApiResult<MovieList>>(Success(MovieList(movies: [])));
    when(mockRepository.getPopularMovies(page: testPage)).thenAnswer((_) async => expectedResult);

    // Then: getPopularMovies 호출 성공 여부 확인
    final result = await useCase.getPopularMovies(page: testPage);
    expect(result, isA<Success<MovieList>>());
    expect((result as Success<MovieList>).data, movieList);
    expect((result).data, isNot(emptyList));

    // Then: getPopularMovies 동작 횟수 확인
    verify(mockRepository.getPopularMovies(page: testPage)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
