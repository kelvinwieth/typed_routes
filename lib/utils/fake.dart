import 'package:faker/faker.dart';

class Fake {
  static String get id => Faker().guid.guid();
}
