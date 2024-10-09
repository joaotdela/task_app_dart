import 'package:flutter/material.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/repository/supabase_repository.dart';

class TaskGroupProvider extends ChangeNotifier{
  final supabaseRepository = SupabaseRepository();
  List<TaskGroup> _taskGroups = [];
  List<TaskGroup>  get taskGroups => _taskGroups;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> listTaskGroups() async{
    _isLoading = true;
    notifyListeners();
    _taskGroups = await supabaseRepository.listTaskGroups();
    _isLoading = false;
    notifyListeners();
  }
}