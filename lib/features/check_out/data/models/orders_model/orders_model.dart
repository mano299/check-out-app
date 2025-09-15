import 'item.dart';

class OrdersModel {
  List<Item>? items;

  OrdersModel({this.items});

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
