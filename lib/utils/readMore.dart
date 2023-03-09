import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle style;

  const ReadMoreText({Key? key, required this.text, this.maxLines = 3, required this.style}) : super(key: key);

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        // Create a TextSpan with the given text and style
        final textSpan = TextSpan(text: widget.text, style: widget.style);

        // Create a TextPainter to measure the number of lines
        final textPainter = TextPainter(text: textSpan, maxLines: widget.maxLines, textDirection: TextDirection.ltr);
        textPainter.layout(maxWidth: size.maxWidth);

        // Check if the text exceeds the max lines
        final isExceeding = textPainter.didExceedMaxLines;

        // Return a column with the text and a button if needed
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Use a RichText to show the text with ellipsis if collapsed
            RichText(
              text: TextSpan(
                children: [
                  // Show only the visible part of the text if collapsed
                  if (!_isExpanded && isExceeding)
                    TextSpan(
                      text: widget.text.substring(0, textPainter.getPositionForOffset(Offset(size.maxWidth, size.maxHeight)).offset),
                      style: widget.style,
                    ),
                  // Show all the text if expanded or not exceeding
                  if (_isExpanded || !isExceeding) 
                    TextSpan(
                      text: widget.text,
                      style: widget.style,
                    ),
                  // Show an ellipsis character at the end if collapsed
                  if (!_isExpanded && isExceeding)
                    const TextSpan(text: '…', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            // Show a button to toggle the expansion if exceeding
            if (isExceeding)
              TextButton(
                onPressed: () => setState(() => _isExpanded = !_isExpanded),
                child:
                    Text(_isExpanded ? 'Read less' : 'Read more', style: TextStyle(color: Colors.blue)),
              ),
          ],
        );
      },
    );
  }
}