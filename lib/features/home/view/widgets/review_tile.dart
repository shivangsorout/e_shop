import 'package:e_shop/core/extensions/buildcontext/media_query_size.dart';
import 'package:e_shop/features/home/model/review.dart';
import 'package:e_shop/features/home/view/widgets/star_ratings.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago show format;

class ReviewTile extends StatefulWidget {
  final Review review;
  const ReviewTile({
    super.key,
    required this.review,
  });

  @override
  State<ReviewTile> createState() => _ReviewTileState();
}

class _ReviewTileState extends State<ReviewTile> {
  late final String timeAgo;

  @override
  void initState() {
    final DateTime dateTime = widget.review.date;
    timeAgo = timeago.format(dateTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 0.0342 * context.mqSize.height,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 0.3 * context.mqSize.width,
                      child: Text(
                        widget.review.reviewerName,
                        style: TextStyle(
                          fontSize: 0.0205 * context.mqSize.height,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff070C18),
                        ),
                      ),
                    ),
                    Text(
                      timeAgo,
                      style: TextStyle(
                        color: const Color(0xffB7B7B7),
                        fontSize: 0.0182 * context.mqSize.height,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 0.0057 * context.mqSize.height,
                    bottom: 0.0114 * context.mqSize.height,
                  ),
                  child: StarRatings(
                      rating: double.parse(widget.review.rating.toString())),
                ),
                Text(
                  widget.review.comment,
                  style: TextStyle(
                    fontSize: 0.0182 * context.mqSize.height,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
