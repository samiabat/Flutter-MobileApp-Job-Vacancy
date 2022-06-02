import 'package:flutter/material.dart';
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
                                  Text("Company posted ${company.follower}"),
                                  Text("Company updated on ${company.job}"),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text("apply"),
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
