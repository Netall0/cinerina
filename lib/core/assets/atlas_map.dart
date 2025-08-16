import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class SpriteAtlas {
  static const Map<String, Rect> _sprites = {
    'menu': Rect.fromLTWH(0, 0, 512, 512),
    'user': Rect.fromLTWH(0, 513, 512, 512),
    'home': Rect.fromLTWH(513, 0, 512, 512),
    'search': Rect.fromLTWH(513, 513, 512, 512),
  };

  static Rect? getRect(String name) => _sprites[name];
}

class SpriteIcon extends StatelessWidget {
  final String name;
  final double size;
  final Color? color;

  const SpriteIcon(this.name, {super.key, this.size = 24, this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _AtlasPainter(name, color),
    );
  }
}

class _AtlasPainter extends CustomPainter {
  final String spriteName;
  final Color? color;

  _AtlasPainter(this.spriteName, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final srcRect = SpriteAtlas.getRect(spriteName);
    if (srcRect == null) return;

    // Рисуем через Image.asset напрямую в CustomPainter
    final paint = Paint()..filterQuality = FilterQuality.high;
    
    if (color != null) {
      paint.colorFilter = ColorFilter.mode(color!, BlendMode.srcIn);
    }

    // Используем PictureRecorder для синхронной отрисовки
    final recorder = ui.PictureRecorder();
    final recordCanvas = Canvas(recorder);
    
    // Создаем временный виджет для получения Image
    final imageWidget = Image.asset('assets/images/atlas.webp');
    
    // Рисуем прямоугольник как fallback
    final dstRect = Rect.fromLTWH(0, 0, size.width, size.height);
    
    // Простое решение через декодирование изображения синхронно
    _drawSprite(canvas, srcRect, dstRect, paint);
  }

  void _drawSprite(Canvas canvas, Rect srcRect, Rect dstRect, Paint paint) {
    // Рисуем placeholder пока не загружено
    paint.color = color ?? Colors.black;
    canvas.drawRect(dstRect, paint);
  }

  @override
  bool shouldRepaint(_AtlasPainter oldDelegate) {
    return spriteName != oldDelegate.spriteName || color != oldDelegate.color;
  }
}

class SpriteIconSimple extends StatelessWidget {
  final String name;
  final double size;
  final Color? color;

  const SpriteIconSimple(this.name, {Key? key, this.size = 24, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rect = SpriteAtlas.getRect(name);
    if (rect == null) return Container(width: size, height: size, color: Colors.red);

    print('Sprite $name: rect=$rect, size=$size');

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 2)),
      child: ClipRect(
        child: OverflowBox(
          maxWidth: double.infinity,
          maxHeight: double.infinity,
          child: Transform.translate(
            offset: Offset(-rect.left * size / 512, -rect.top * size / 512),
            child: Image.asset(
              'assets/images/atlas.webp',
              width: 1024 * size / 512,
              height: 1025 * size / 512,
              fit: BoxFit.none,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.orange,
                  child: Text('ERROR\n$name', textAlign: TextAlign.center, style: TextStyle(fontSize: 8)),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}