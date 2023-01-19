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

List<String> images = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
  "https://wallpaperaccess.com/full/2637581.jpg"
];
