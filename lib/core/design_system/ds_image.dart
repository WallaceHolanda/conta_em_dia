import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DsImage extends StatelessWidget {
  final String path;
  final double width;
  final double height;

  const DsImage({
    super.key,
    required this.path,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
    );
  }
}
