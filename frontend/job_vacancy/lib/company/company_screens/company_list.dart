import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../company_bloc_folder/company_bloc_export.dart';

class CompanysList extends StatefulWidget {
  const CompanysList({Key? key}) : super(key: key);

  @override
  State<CompanysList> createState() => _CompanysListState();
}

class _CompanysListState extends State<CompanysList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("List of companies")),
      ),
      body: Center(
        child: Container(
          child: BlocBuilder<CompanyBloc, CompanyState>(
            builder: (context, state) {
              if (state is CompanyLoadSuccess) {
                final companies = state.companies;
                return buildPageWithData(companies);
              }
              if (state is CompanyOperationFailure) {
                return buildFailure();
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget buildPageWithData(List<dynamic> companies) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: companies.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => context.goNamed('companyDetails',
                params: {"id": companies[index].id.toString()}),
            child: ListTile(
              title: Text(companies[index].name),
              subtitle: Text(companies[index].description),
              trailing: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () {},
                child:
                    const Text("Delete", style: TextStyle(color: Colors.white)),
              ),
            ),
          );
        });
  }

  Widget buildFailure() {
    return const Text("Fail to load");
  }
}
