import 'package:shop_app/data/models/comment.dart';

class Product {
  final int price;
  final String title;
  final String description;
  final int oldPrice;
  final List<Comment> comments;
  final List<String> images;

  const Product({
    this.price,
    this.title,
    this.description,
    this.oldPrice,
    this.comments,
    this.images,
  });
}
