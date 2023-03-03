// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:ideal/shared/data_source.dart';

import 'models/customer_capsule.dart';

class CustomerRepository {
  final SharedPreferencesDataSource dataSource;
  CustomerRepository({
    required this.dataSource,
  });

  CustomersCapsule get customers => CustomersCapsule.fromJson(dataSource.load('customers'));

  set customers(CustomersCapsule capsule) => dataSource.save('customers', capsule.toJson());
}
