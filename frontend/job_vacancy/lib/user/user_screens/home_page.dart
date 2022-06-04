import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_vacancy/jobs/job_bloc_folder/job_bloc_export.dart';
import 'package:job_vacancy/user/user_screens/admin_page/admin_page.dart';
import 'package:job_vacancy/user/user_screens/cards.dart';
import 'package:job_vacancy/user/user_screens/jobs.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title, this.refresh = true})
      : super(key: key);

  final String title;
  var refresh;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    if (widget.refresh) {
      setState(() {
        BlocProvider.of<JobBloc>(context).add(JobLoad());
      });
    }
    ;
    return FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => GoRouter.of(context).goNamed("companies"),
              icon: const Icon(Icons.adobe_sharp),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () => GoRouter.of(context).goNamed("login"),
              icon: const Icon(Icons.login),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () => GoRouter.of(context).goNamed("admin"),
              icon: const Icon(Icons.perm_contact_cal_sharp),
            ),
          ],
        ),
        body: BlocBuilder<JobBloc, JobState>(
          builder: (context, state) {
            if (state is JobLoadSuccess) {
              var jobs = state.jobs;
              return Column(
                children: [
                  SafeArea(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: SafeArea(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: jobs
                                  .map((job) => CustomCard(job: job))
                                  .toList()),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: jobs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => context.goNamed(
                            'details',
                            params: {
                              "id": jobs[index].id.toString(),
                            },
                          ),
                          child: Widget1(
                            job: jobs[index],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text("woops no job!"));
            }
          },
        ),
        drawer: const AdminPage(),
      );
    });
  }

  //padding: EdgeInsets.fromLTRB(15, 140, 15, 10),

}
