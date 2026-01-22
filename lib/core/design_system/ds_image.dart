import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DsImage extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  final Color? color;

  const DsImage({
    super.key,
    required this.path,
    required this.width,
    required this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      fit: BoxFit.contain,
      colorFilter: color != null
          ? ColorFilter.mode(
              color!,
              BlendMode.srcIn,
            )
          : null,
    );
  }
}
