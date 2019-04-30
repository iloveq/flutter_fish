import 'package:flutter_screenutil/flutter_screenutil.dart';

double w(double pxW){
  return ScreenUtil.getInstance().setWidth(pxW);
}

double h(double pxH){
  return ScreenUtil.getInstance().setHeight(pxH);
}

double sp(double px){
  return ScreenUtil.getInstance().setSp(px);
}