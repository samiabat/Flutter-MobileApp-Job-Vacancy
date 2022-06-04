import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../company_bloc_folder/company_bloc_export.dart';

class CompanysList extends StatefulWidget {
  CompanysList({Key? key}) : super(key: key);

  @override
  State<CompanysList> createState() => _CompanysListState();
}

class _CompanysListState extends State<CompanysList> {
  _CompanysListState({this.refresh = false});
  var refresh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("List of companies")),
        actions: [
          IconButton(
            onPressed: () => context.goNamed("addCompany"),
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () => context.goNamed("home"),
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: BlocBuilder<CompanyBloc, CompanyState>(
            builder: (context, state) {
              if (!refresh) {
                BlocProvider.of<CompanyBloc>(context).add(CompanyLoad());
                refresh = true;
              }
              if (state is CompanyLoadSuccess) {
                final companies = state.companies;
                return buildPageWithData(companies);
              }
              if (state is CompanyOperationFailure) {
                BlocProvider.of<CompanyBloc>(context).add(CompanyLoad());
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
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              onPressed: () {},
              child:
                  const Text("Follow", style: TextStyle(color: Colors.white)),
            ),
          ),
        );
      },
    );
  }

  Widget buildFailure() {
    return const Text("Fail to load");
  }
}
