import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/app/data/todo.dart';
import 'package:test_getx/app/modules/home/controllers/home_controller.dart';

class EditTidoView extends StatelessWidget {
  final int? index;
  final Todo? todo;
  final _formKey = GlobalKey<FormState>();
  final HomeController controller = Get.find();
  EditTidoView({this.index, this.todo, Key? key}) : super(key: key) {
    if (this.todo != null) {
      controller.setEditedTodo(todo!);
    } else {
      controller.clearForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: this.todo != null ? Text('Edit Todo') : Text('Add New Todo'),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  focusNode: controller.titleFocus,
                  controller: controller.titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: controller.descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (todo == null) {
                          controller.addNewTodo();
                        } else {
                          controller.editTodo(this.index!);
                        }
                      }
                      Get.back();
                    },
                    child: this.todo != null ? Text('Edit') : Text('Add New'))
              ],
            )));
  }
}
