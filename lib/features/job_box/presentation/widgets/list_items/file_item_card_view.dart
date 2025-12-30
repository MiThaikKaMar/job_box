import 'package:flutter/material.dart';
import 'package:job_box/core/utils/dimens.dart';

class FileCardView extends StatelessWidget {
  final String fileName;
  final String date;
  final Color cardColor;
  final Color childColor;

  const FileCardView(
      {super.key,
      required this.fileName,
      required this.date,
      required this.cardColor,
      required this.childColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kMarginMedium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kMarginSmall),
        color: cardColor,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: kMarginMedium, vertical: kMarginMedium2),
              child: Icon(
                Icons.file_copy,
                color: childColor,
                size: kMarginXLarge,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  style: TextStyle(
                    color: childColor,
                    fontWeight: FontWeight.w700,
                    fontSize: kTextRegular2x,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(color: childColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
