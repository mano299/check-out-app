import 'package:check_out_app/features/check_out/data/models/amount_model/amount_model.dart';
import 'package:check_out_app/features/check_out/data/models/amount_model/details.dart';
import 'package:check_out_app/features/check_out/data/models/orders_model/item.dart';
import 'package:check_out_app/features/check_out/data/models/orders_model/orders_model.dart';

({AmountModel amount, OrdersModel ordersList}) getTransactionsData() {
  var amountModel = AmountModel(
    total: "50.97",
    currency: "USD",
    details: Details(shipping: "0", shippingDiscount: 0, subtotal: "50.97"),
  );
  List<Order> orders = [
    Order(
      name: "Apple",
      currency: "USD",
      quantity: 1,
      price: "50.97",
    ),
  ];
  var ordersList = OrdersModel(orders: orders);
  return (amount: amountModel, ordersList: ordersList);
}
