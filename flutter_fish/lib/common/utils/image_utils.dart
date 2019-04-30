import 'package:flutter/widgets.dart';

Image getImage(path) {
  return new Image.asset(path, width: 24.0, height: 24.0);
}

Image loadImageFullScreen(BuildContext context ,String imagePath){
  return new Image.asset(imagePath,
      fit: BoxFit.fill,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height
  );
}