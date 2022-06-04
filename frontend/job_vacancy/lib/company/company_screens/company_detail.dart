import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_vacancy/company/company_bloc_folder/company_bloc_export.dart';
import 'package:job_vacancy/company/company_models/company_model.dart';

class CompanyDetail extends StatelessWidget {
  final Future<Company> company;
  const CompanyDetail({Key? key, required this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Company Detail")),
      ),
      body: FutureBuilder<Company>(
          future: getCompany(),
          builder: (context, snapshot) {
            var company = snapshot.data;
            return Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: company != null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(company.name),
                              subtitle: Column(
                                children: [
                                  Text(company.description),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          BlocProvider.of<CompanyBloc>(context)
                                              .add(CompanyDelete(
                                                  company.id.toString()));
                                          context.goNamed("companies",
                                              extra: {"refresh": true});
                                        },
                                        icon: const Icon(Icons.delete),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text("apply"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const Text("woops no Company!"),
                  )
                ],
              ),
            );
          }),
    );
  }

  Future<Company> getCompany() async {
    return await company;
  }
}
