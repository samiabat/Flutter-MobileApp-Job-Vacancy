
// void main(){
//   final JobRepository jobRepository;
//   group("Job unit test",(){
//    blocTest(
//      "Emits [] when nothing is added",
//     build:()=>JobBloc(jobRepository),
//     expect:()=>[],
//    );
//    blocTest(
//      "Emit [JobLoading]",
//      build:()=>JobBloc(jobRepository),
//      act:(bloc)=>bloc.add(JobLoad(jobRepository)),
//      expect:()=>JobLoading(),
//    );

//   });
// }
// Description text to show when test runs.
// build => is used to create BLoC or Cubit object for test.
// act => is used to add event or to call method for trigger BLoC.
// expect => is a simple Iterable, which is used to ensure that act called from previous parameter will return State or States noted in here.


//  class MockJobRepository extends Mock implements JobRepository{}
//  void main(){
//    MockJobRepository mockJob;
//    setUp((){
//      mockJob=MockJobRepository();

//    });
//    group('get jobs ',(){});
//  }





















