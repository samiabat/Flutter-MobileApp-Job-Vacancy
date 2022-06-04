
void main(){
  final JobRepository jobRepository;
  group("Job unit test",(){
  jobRepository=JobRepository();

   blocTest<JobBloc,JobState>(
     "Emit [JobLoading]",
     build:()=>JobBloc(jobRepository:jobRepository),
     act:(bloc)=>bloc.add(JobLoad(jobRepository)),
     expect:()=><JobEvent>[JobLoading()],
   );
  });
}












