import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

class ShaderEffect extends StatefulWidget {
  const ShaderEffect({
    super.key,
    required this.shaderAsset,
    required this.child,
  });
  final String shaderAsset;
  final Widget child;

  @override
  State<ShaderEffect> createState() => _ShaderEffectState();
}

class _ShaderEffectState extends State<ShaderEffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  );

  late final Animation<double> _animation = Tween(
    begin: 10.0,
    end: 1.0,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );

  @override
  void initState() {
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        return ShaderBuilder(
          assetKey: widget.shaderAsset,
          (context, shader, _) => AnimatedSampler(
            (image, size, canvas) {
              shader.setFloat(0, size.width);
              shader.setFloat(1, size.height);
              shader.setFloat(2, _animation.value);
              shader.setImageSampler(0, image);

              canvas.drawRect(
                Rect.fromLTWH(0, 0, size.width, size.height),
                Paint()..shader = shader,
              );
            },
            child: widget.child,
          ),
        );
      },
    );
  }
}
