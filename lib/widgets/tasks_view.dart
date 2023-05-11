import 'package:flutter/material.dart';
import 'package:nabu/generated/l10n.dart';
import 'package:nabu/themes/custom_ui.dart';

class TasksView extends StatefulWidget {
  const TasksView({Key? key}) : super(key: key);
  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  // final _tasksStream =
  //     Supabase.instance.client.from('tasks').stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: StreamBuilder<List<Map<String, dynamic>>>(
        // stream: _tasksStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final tasks = snapshot.data!;

            if (tasks.isEmpty) {
              return Text(
                l10n.tasksViewNoTasksToDisplay,
                style: TextStyle(
                  fontSize: CustomUI.xSize(4),
                  fontWeight: FontWeight.bold,
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).shadowColor.withOpacity(0.2),
                            blurRadius: 4,
                            offset:
                                Offset(0, 3), // shadow direction: bottom right
                          ),
                        ],
                      ),
                      child: ListTile(
                        horizontalTitleGap: 4,
                        leading: Icon(Icons.task,
                            color: Theme.of(context).primaryColor),
                        title: Text(
                          tasks[index]['task_name'],
                          style: TextStyle(
                              fontSize: CustomUI.xSize(3.75),
                              overflow: TextOverflow.ellipsis),
                        ),
                        subtitle: Text(
                          tasks[index]['inserted_at'],
                          style: TextStyle(
                              fontSize: CustomUI.xSize(2),
                              overflow: TextOverflow.ellipsis),
                        ),
                        trailing: PopupMenuButton(
                          itemBuilder: (context) {
                            return [
                              /* PopupMenuItem(
                            value: 'edit',
                            child: const Text(
                              'Edit',
                              style: TextStyle(fontSize: 13.0),
                            ),
                            onTap: () {
                              String taskId = (data['id']);
                              String taskName = (data['taskName']);
                              String taskDesc = (data['taskDesc']);
                              String taskTag = (data['taskTag']);
                              Future.delayed(
                                const Duration(seconds: 0),
                                () => showDialog(
                                  context: context,
                                  builder: (context) => UpdateTaskAlertDialog(
                                    taskId: taskId,
                                    taskName: taskName,
                                    taskDesc: taskDesc,
                                    taskTag: taskTag,
                                  ),
                                ),
                              );
                            },
                          ),
                          PopupMenuItem(
                            value: 'delete',
                            child: const Text(
                              'Delete',
                              style: TextStyle(fontSize: 13.0),
                            ),
                            onTap: () {
                              String taskId = (data['id']);
                              String taskName = (data['taskName']);
                              Future.delayed(
                                const Duration(seconds: 0),
                                () => showDialog(
                                  context: context,
                                  builder: (context) => DeleteTaskDialog(
                                      taskId: taskId, taskName: taskName),
                                ),
                              );
                            },
                          ), */
                            ];
                          },
                        ),
                        dense: true,
                      ),
                    );
                  });
            }
          }
        },
      ),
    );
  }
}
