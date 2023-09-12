import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  ImageWidgetState createState() => ImageWidgetState();
}

class ImageWidgetState extends State<ImageWidget> {
  late ImageProvider _imageProvider;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    // Load the image provider
    _imageProvider = NetworkImage(widget.imageUrl);

    // Listen for the image loading completion
    _imageProvider.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (info, synchronousCall) {
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading
          ? CircularProgressIndicator.adaptive(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
            )
          : Image(
              image: _imageProvider,
            ),
    );
  }
}
