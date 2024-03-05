import 'package:compatibility_app/model/sliders.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SliderItem extends StatelessWidget {
  final SliderData slider;
  const SliderItem({required this.slider, super.key});

  @override
  Widget build(BuildContext context) {
    return _buildSliderItem(slider);
  }

  Widget _buildSliderItem(SliderData slider) => InkWell(
    child: Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10.r)),
      child: CachedImage(imageUrl: slider.imageUrl!),
    ),
    onTap: () {},
  );
}
