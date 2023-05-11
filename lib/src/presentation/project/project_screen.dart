import 'package:flutter/material.dart';
import 'package:portfolio/common/widgets/rounded_search_bar.dart';
import 'package:portfolio/src/presentation/project/project_item.dart';
import 'package:portfolio/src/presentation/project/project_list_provider.dart';
import 'package:portfolio/utils/lib/provider/provider_ext.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  late ColorScheme colorScheme;
  late ProjectListProvider projectListProvider;

  @override
  void didChangeDependencies() {
    projectListProvider = context.provider();
    colorScheme = Theme.of(context).colorScheme;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: RoundedSearchBar(
                width: double.infinity,
                height: 60,
              ),
            ),
            Container(
              color: Colors.black,
              width: double.infinity,
              height: 100,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                spacing: 10,
                runSpacing: 10,
                children: projectListProvider.get().map((e) {
                  return ProjectItem(
                    width: 250,
                    height: 220,
                    projectInfo: e,
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
