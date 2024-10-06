import 'package:e_shop/core/extensions/buildcontext/media_query_size.dart';
import 'package:e_shop/features/home/view/widgets/network_image_viewer.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final List<String> imgList;

  const ImageSlider({
    super.key,
    required this.imgList,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;
  late final PageController _imgController;

  @override
  void initState() {
    _imgController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _imgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade400,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _imgController,
              itemCount: widget.imgList.length,
              onPageChanged: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: NetworkImageViewer(
                        imgUrl: widget.imgList[index],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        if (widget.imgList.length > 1)
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.0486 * context.mqSize.width,
                vertical: 0.0296 * context.mqSize.height,
              ),
              child: Row(
                children: widget.imgList.asMap().entries.map((entry) {
                  return Container(
                    width: 0.017 * context.mqSize.width,
                    height: 0.0079 * context.mqSize.height,
                    margin: EdgeInsets.symmetric(
                      horizontal: 0.0121 * context.mqSize.width,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? const Color(0xff101010)
                          : const Color(0xffB7B7B7),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
      ],
    );
  }
}
