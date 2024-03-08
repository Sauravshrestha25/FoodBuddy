class FoodModel {
  static List<Foods> items = [
    Foods(
        id: 1,
        restaurant: "Burger Express",
        name: "Khana Set",
        city: "Kathmandu",
        price: 320,
        address: "Balkumari",
        image: "assets/images/mk1.jpeg"),
    Foods(
        id: 2,
        restaurant: "Upper Ground",
        name: "Momo",
        city: "Lalitpur",
        price: 120,
        address: "Kharibot",
        image: "assets/images/m1.jpeg"),
    Foods(
        id: 3,
        restaurant: "Lower Ground",
        name: "Noodles",
        city: "Kathmandu",
        price: 140,
        address: "Koteshwor",
        image: "assets/images/Yakisoba Noodles.jpg"),
    Foods(
        id: 4,
        restaurant: "Burger House",
        name: "Pizza",
        city: "Lalitpur",
        price: 330,
        address: "Gwarko",
        image: "assets/images/pizza.jpg"),
    Foods(
        id: 5,
        restaurant: "Kwality Food Cafe",
        name: "Biryani",
        city: "Kathmandu",
        price: 220,
        address: "Balkumari",
        image: "assets/images/biryani.jpeg"),
    Foods(
        id: 6,
        restaurant: "Bajeko Kima Noodles",
        name: "Chowmein",
        city: "Kathmandu",
        price: 110,
        address: "Baneshwor",
        image: "assets/images/n1.jpg"),
    Foods(
        id: 7,
        restaurant: "Burger House",
        name: "Burger",
        city: "Kathmandu",
        price: 170,
        address: "Satdobato",
        image: "assets/images/burger.jpeg"),
    Foods(
        id: 8,
        restaurant: "Newari khaja Ghar",
        name: "French Fry",
        city: "Lalitpur",
        price: 80,
        address: "Lagankhel",
        image: "assets/images/fry.jpeg"),
  ];
  Foods getById(int id) => items[id];

  Foods getByPosition(int pos) => items[pos];
}

class Foods {
  final int id;
  final String restaurant;
  final String name;
  final String city;
  final num price;
  final String address;
  final String image;

  Foods({
    required this.id,
    required this.restaurant,
    required this.name,
    required this.city,
    required this.price,
    required this.address,
    required this.image,
  });
}
