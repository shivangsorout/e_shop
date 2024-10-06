class Review {
  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;
  final String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  // Factory constructor to create a Review object from JSON
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json[ratingKey],
      comment: json[commentKey],
      date: DateTime.parse(
          json[dateKey]), // Parse the date string into a DateTime object
      reviewerName: json[reviewerNameKey],
      reviewerEmail: json[reviewerEmailKey],
    );
  }

  // Method to convert a Review object into JSON
  Map<String, dynamic> toJson() {
    return {
      ratingKey: rating,
      commentKey: comment,
      dateKey: date.toIso8601String(), // Convert DateTime to ISO8601 string
      reviewerNameKey: reviewerName,
      reviewerEmailKey: reviewerEmail,
    };
  }
}

const ratingKey = 'rating';
const commentKey = 'comment';
const dateKey = 'date';
const reviewerNameKey = 'reviewerName';
const reviewerEmailKey = 'reviewerEmail';
