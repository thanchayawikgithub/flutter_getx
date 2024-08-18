import 'package:get/get.dart';
import 'package:test_getx/app/data/services/todo_service.dart';
import 'package:test_getx/app/data/todo.dart';

class HomeController extends GetxController {
  final TodoService todoService = Get.find();

  void addNewTodo() {
    todoService
        .addTodo(Todo(title: 'New Task', description: 'Task Description'));
  }

  void toggleTodoStatus(int index) {
    todoService.toggleTodoStatus(index);
  }

  void removeTodoAt(int index) {
    todoService.removeTodoAt(index);
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
