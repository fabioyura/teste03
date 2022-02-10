import 'package:flutter/material.dart';

class BtnSite extends StatefulWidget {
  final String title;
  final String link;
  final double width;
  final double height;
  final Function funcao;
  const BtnSite(
      {Key? key,
      required this.title,
      required this.link,
      required this.width,
      required this.height,
      required this.funcao})
      : super(key: key);

  @override
  _BtnSiteState createState() => _BtnSiteState();
}

class _BtnSiteState extends State<BtnSite> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.funcao();
      },
      child: CustomPaint(
        painter: BtnSitePainter(
          shadow: const Shadow(blurRadius: 2),
          clipper: BtnShape(),
        ),
        child: ClipPath(
          clipper: BtnShape(),
          child: Container(
            color: const Color.fromARGB(255, 0, 0, 0),
            width: widget.width,
            height: widget.height,
            child: Center(
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BtnShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(30.0, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width - 30, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(30.0, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BtnSitePainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  BtnSitePainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    paint.color = const Color.fromARGB(255, 59, 59, 59);
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
