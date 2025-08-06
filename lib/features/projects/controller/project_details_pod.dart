import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/project_model.dart';

final projectDetailsPod = StateProvider.autoDispose<List<ProjectModel>>((ref) {
  return <ProjectModel>[
    ProjectModel(
      projectName: 'Project 1',
      projectDescription: 'Project Description 1',
    ),
    ProjectModel(
      projectName: 'Project 2',
      projectDescription: 'Project Description 2',
    ),
    ProjectModel(
      projectName: 'Project 3',
      projectDescription: 'Project Description 3',
    ),
    ProjectModel(
      projectName: 'Project 4',
      projectDescription: 'Project Description 4',
    ),
    ProjectModel(
      projectName: 'Project 5',
      projectDescription: 'Project Description 5',
    ),
  ];
});
final hoverPod = StateProvider.autoDispose.family<bool, int>((ref, id) => false);