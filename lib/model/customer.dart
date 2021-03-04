import 'package:meta/meta.dart';

class Customer {
  final String documentId;
  final int reward_points;
  String path;

  Customer({this.documentId, @required this.reward_points, this.path});

  Map<String, dynamic> toMap() {
    return {
      'reward_points': reward_points,
    };
  }

  factory Customer.fromMap(
      Map<String, dynamic> data, String documentId, String path) {
    final int reward_points = data['reward_points'];

    Customer customer = Customer(
        documentId: documentId, reward_points: reward_points, path: path);

    print(customer);
    return customer;
  }

  @override
  String toString() => 'documentId: $documentId, reward_points: $reward_points';
}
