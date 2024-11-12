// ignore_for_file: public_member_api_docs, sort_constructors_first
class CostItemModel {
  int? id;
  String? label;
  String? costType;
  double? price;
  String? comment;

  CostItemModel({
    this.id,
    this.label,
    this.costType,
    this.price,
    this.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'costType': costType,
      'price': price,
      'comment': comment,
    };
  }

  CostItemModel copyWith({
    int? id,
    String? label,
    String? costType,
    double? price,
    String? comment,
  }) {
    return CostItemModel(
      id: id ?? this.id,
      label: label ?? this.label,
      costType: costType ?? this.costType,
      price: price ?? this.price,
      comment: comment ?? this.comment,
    );
  }

  @override
  String toString() {
    return 'CostItemModel(id: $id, label: $label, costType: $costType, price: $price, comment: $comment)';
  }
}
