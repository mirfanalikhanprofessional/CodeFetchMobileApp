import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    required this.imageUrlOrPath,
    this.width = 150,
    this.height = 150,
    this.borderRadius = 8,
    this.fit = BoxFit.cover,
    this.isAsset = false,
    this.enableFullScreen = true,
    super.key,
  });

  final String imageUrlOrPath;
  final double width;
  final double height;
  final double borderRadius;
  final BoxFit fit;
  final bool isAsset;
  final bool enableFullScreen;

  @override
  Widget build(BuildContext context) {
    final isSvg = imageUrlOrPath.toLowerCase().endsWith('.svg');

    return GestureDetector(
      onTap: enableFullScreen
          ? () => _showFullScreenImage(context, imageUrlOrPath, isSvg, isAsset)
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          borderRadius
        ), // Optional rounded corners
        child: _buildImage(isSvg),
      ),
    );
  }

  Widget _buildImage(bool isSvg) {
    if (isAsset) {
      // Asset Images
      return isSvg
          ? SvgPicture.asset(
        imageUrlOrPath,
        width: width,
        height: height,
        fit: fit,
      )
          : Image.asset(
        imageUrlOrPath,
        width: width,
        height: height,
        fit: fit,
      );
    } else {
      // Network Images
      return isSvg
          ? SvgPicture.network(
        imageUrlOrPath,
        width: width,
        height: height,
        fit: fit,
        placeholderBuilder: (context) => SizedBox(
          width: width,
          height: height,
          child: const Center(child: CircularProgressIndicator()),
        ),
      )
          : Image.network(
        imageUrlOrPath,
        width: width,
        height: height,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return _errorPlaceholder();
        },
      );
    }
  }

  Widget _errorPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
      child: const Icon(
        Icons.broken_image,
        color: Colors.grey,
        size: 50,
      ),
    );
  }

  void _showFullScreenImage(
      BuildContext context, String urlOrPath, bool isSvg, bool isAsset) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FullScreenImage(
          imageUrlOrPath: urlOrPath,
          isSvg: isSvg,
          isAsset: isAsset,
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imageUrlOrPath;
  final bool isSvg;
  final bool isAsset;

  const FullScreenImage({
    super.key,
    required this.imageUrlOrPath,
    required this.isSvg,
    required this.isAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: isSvg
            ? isAsset
            ? SvgPicture.asset(imageUrlOrPath)
            : SvgPicture.network(imageUrlOrPath)
            : isAsset
            ? Image.asset(imageUrlOrPath)
            : Image.network(imageUrlOrPath),
      ),
    );
  }
}
