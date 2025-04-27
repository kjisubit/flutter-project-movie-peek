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
    // Given: 테스트 데이터 설정
    final testPage = 1;
    final movieList = MovieList(
      movies: [Movie(id: 1, title: 'Test Movie', posterPath: '/test.jpg')],
    );
    final expectedResult = Success<MovieList>(movieList);

    // Given: Mock 동작 설정
    provideDummy<ApiResult<MovieList>>(Success(MovieList(movies: [])));
    when(mockRepository.getPopularMovies(page: testPage))
        .thenAnswer((_) async => expectedResult);

    // When: UseCase의 getPopularMovies 메서드 호출
    final result = await useCase.getPopularMovies(page: testPage);

    // Then: 결과가 Success<MovieList> 타입인지 확인
    expect(result, isA<Success<MovieList>>());

    // Then: 반환된 데이터가 예상한 movieList와 동일한지 확인
    expect((result as Success<MovieList>).data, movieList);

    // Then: MockRepository의 getPopularMovies가 정확히 한 번 호출되었는지 확인
    verify(mockRepository.getPopularMovies(page: testPage)).called(1);

    // Then: MockRepository에 더 이상 다른 상호작용이 없는지 확인
    verifyNoMoreInteractions(mockRepository);
  });
}
