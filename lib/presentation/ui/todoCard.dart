import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const TodoCard(
      {super.key,
      required this.title,
      required this.description,
      required this.onDelete,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        margin: const EdgeInsets.fromLTRB(8, 8, 4, 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: onDelete,
                ),
              ])),
        ));
  }
}
