import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String? description;
  final String note;
  final VoidCallback onDelete;

  const NoteCard({
    super.key,
    this.description,
    required this.note,
    required this.title,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: textStyle.titleMedium!.copyWith(
                  fontSize: 24,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              ),
            ],
          ),
          if (description != null)
            Text(
              description!,
              style: textStyle.bodyMedium!.copyWith(
                fontWeight: FontWeight.w300,
              ),
            )
          else
            const SizedBox(height: 16),
          const SizedBox(height: 8),
          Text(
            note,
            style: textStyle.bodyMedium!.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
