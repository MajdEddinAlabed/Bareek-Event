class Event {
  String name;
  String description;
  DateTime eventDate;
  String image;
  String location;
  String organizer;

  Event({
    required this.eventDate,
    required this.image,
    required this.location,
    required this.name,
    required this.organizer,
    required this.description,
  });
}

final List<Event> upcomingEvents = [
  Event(
    name: "The Super party",
    eventDate: DateTime.now().add(const Duration(days: 24)),
    image: 'https://source.unsplash.com/800x600/?concert',
    description:
        "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    location: "El Rehab city",
    organizer: "Majd Eddin Alabed",
  ),
];

final List<Event> nearbyEvents = [
  Event(
    name: "The Pretty Reckless",
    eventDate: DateTime.now().add(const Duration(days: 1)),
    image: 'https://source.unsplash.com/600x800/?concert',
    description:
        "The pretty reckless is an American rock band from New york city, Formed in 2009. The",
    location: "Fairview Gospel Church",
    organizer: "Westfield Centre",
  ),
];
