import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/TodOProvider.dart';

final textEditingController = TextEditingController();
final descriptionController = TextEditingController();

addData(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          width: 400,
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(hintText: "Title"),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(hintText: "description"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (textEditingController.toString() != null &&
                      descriptionController.toString() != null) {
                    Provider.of<TodoProvider>(context, listen: false).postData({
                      "title": textEditingController.text.toString(),
                      "description": descriptionController.text.toString()
                    }).whenComplete(() => Navigator.pop(context));
                  }
                },
                child: Text("Submit"),
              )
            ],
          ),
        );
      });
}

updateDataWidget(BuildContext context, String id) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          width: 400,
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(hintText: "Title"),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(hintText: "description"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (textEditingController.toString() != null &&
                      descriptionController.toString() != null) {
                    Provider.of<TodoProvider>(context, listen: false)
                        .updateData({
                      "_id": id,
                      "title": textEditingController.text.toString(),
                      "description": descriptionController.text.toString()
                    }).whenComplete(() {
                      Navigator.pop(context);
                    });
                  }
                },
                child: Text("Update Todo"),
              )
            ],
          ),
        );
      });
}
