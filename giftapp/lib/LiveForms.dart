// ignore_for_file: file_names

class Car {
  final String name;
  final String status;
  final String image;

  Car({required this.name, required this.status, required this.image});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      name: json['name'] as String,
      status: json['status'] as String,
      image: json['image'] as String,
    );
  }
}