import 'package:cv_app/view/home/widget/image_widget.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  final String title;
  final String description;

  const DetailsWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          flex: 4,
          child: description.contains('http')
              ? ImageWidget(imageUrl: description)
              : Text(
                  description,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
        ),
      ],
    );
  }
}
