class Item {
  String day;
  String time;
  String date;
  String timeAgo;
  String title;
  String desc;

  Item({
    required this.day,
    required this.time,
    required this.date,
    required this.timeAgo,
    required this.title,
    required this.desc,
  });
}

final List<Item> items = [
  Item(
      day: 'Sun, Jan 2023',
      time: '12:06 AM',
      date: '01',
      timeAgo: '17d ago',
      title: 'Happy New Year 2023 !!',
      desc:
          'Happy New Year 2023!! May a New Year arrives with new hope & bag full of blessings, Have a prosperous Happy New Year 2023!!\n\n-Sahara(Ride Sharing Company)'),
];

// For promo screen
class Promo {
  String desc;
  String expiryDate;
  String code;

  Promo({
    required this.desc,
    required this.expiryDate,
    required this.code,
  });
}

final List<Promo> promos = [
  Promo(
    desc:
        'YOU HAVE 100% OFF UPTO RS.150 IN YOUR NEXT SAHARABIKE RIDE, ENJOY YOUR SAHARARIDE',
    expiryDate: 'Jan 15, 2023 11:59 PM',
    code: 'DHUKURE',
  )
];

//For Carousel Sider

class Restaurant {
  String name;
  String address;
  String type;
  String deliveryHours;
  int ratings;
  String imageUrl;

  Restaurant({
    required this.name,
    required this.address,
    required this.type,
    required this.deliveryHours,
    required this.ratings,
    required this.imageUrl,
  });
}

final _restaurant0 = Restaurant(
  name: 'Restaurant Name',
  address: 'Restaurant Address',
  type: 'Multi-cuisine',
  deliveryHours: '11:00 AM-09:00 PM',
  ratings: 5,
  imageUrl: 'lib/assets/restro0.jpg',
);
final _restaurant1 = Restaurant(
  name: 'Restaurant Name',
  address: 'Restaurant Address',
  type: 'Multi-cuisine',
  deliveryHours: '11:00 AM-09:00 PM',
  ratings: 5,
  imageUrl: 'lib/assets/restro1.jpg',
);
final _restaurant2 = Restaurant(
  name: 'Restaurant Name',
  address: 'Restaurant Address',
  type: 'Multi-cuisine',
  deliveryHours: '11:00 AM-09:00 PM',
  ratings: 5,
  imageUrl: 'lib/assets/restro2.jpg',
);
final _restaurant3 = Restaurant(
  name: 'Restaurant Name',
  address: 'Restaurant Address',
  type: 'Multi-cuisine',
  deliveryHours: '11:00 AM-09:00 PM',
  ratings: 5,
  imageUrl: 'lib/assets/restro3.jpg',
);

final List<Restaurant> restaurants = [
  _restaurant0,
  _restaurant1,
  _restaurant2,
  _restaurant3,
];

class Location {
  final String address;

  const Location({required this.address});
}

const allLocations = [
  Location(address: 'Golfutar Stop, Golphutar, BudhanilKantha NagarPalika, Kathmandu'),
  Location(address: 'Hattigauda, Kathmandu'),
  Location(address: 'Milijuli Tol, Kathmandu, Kathmandu'),
  Location(address: 'Narayan Gopal chowk, Kathmandu'),
  Location(address: 'Bhatbateni, Narayan Gopal chowk, Kathmandu'),
  Location(address: 'Basundhara Stop, Kathmandu'),
];
