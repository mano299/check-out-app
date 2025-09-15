import 'package:check_out_app/features/check_out/data/models/amount_model/amount_model.dart';
import 'package:check_out_app/features/check_out/data/models/amount_model/details.dart';
import 'package:check_out_app/features/check_out/data/models/orders_model/item.dart';
import 'package:check_out_app/features/check_out/data/models/orders_model/orders_model.dart';

({AmountModel amount, OrdersModel ordersList}) getTransactionsData() {
    var amountModel = AmountModel(
      total: "70",
      currency: "USD",
      details: Details(shipping: "0", shippingDiscount: 0, subtotal: "70"),
    );
    List<Order> orders = [
      Order(
        name: "Apple",
        currency: "USD",
        quantity: 4,
        price: "5",
      ),
      Order(
        name: "Pineapple",
        currency: "USD",
        quantity: 5,
        price: "10",
      ),
    ];
    var ordersList = OrdersModel(orders: orders);
    return (amount: amountModel, ordersList: ordersList);
  }