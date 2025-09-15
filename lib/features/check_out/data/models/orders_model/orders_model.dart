import 'item.dart';

class OrdersModel {
  List<Order>? orders;

  OrdersModel({this.orders});

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        orders: (json['items'] as List<dynamic>?)
            ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'items': orders?.map((e) => e.toJson()).toList(),
      };
}
