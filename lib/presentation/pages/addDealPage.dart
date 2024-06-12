import 'package:flutter/material.dart';
import 'package:todo/domain/deal.dart';

class AddHabitPage extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final Deal? deal;

  AddHabitPage({super.key, this.deal});

  @override
  Widget build(BuildContext context) {
    if (deal != null) {
      _titleController.text = deal!.title;
      _descriptionController.text = deal!.description;
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Добавить привычку')),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Название'),
            ),
            const SizedBox(height: 16),
            TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Описание'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () => _submit(context),
                child: const Text('Сохранить')),
          ],
        ),
      ),
    );
  }

  void _submit(BuildContext context) {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      Navigator.pop(
          context,
          Deal(
            title: _titleController.text,
            description: _descriptionController.text,
          ));
    }
  }
}
