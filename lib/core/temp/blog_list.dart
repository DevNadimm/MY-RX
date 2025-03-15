class BlogContent {
  final String title;
  final String author;
  final String content;
  final String date;

  BlogContent({
    required this.title,
    required this.author,
    required this.content,
    required this.date,
  });
}

List<BlogContent> blogList = [
  BlogContent(
    title: "The Future of Flutter in 2025",
    author: "Nadim Chowdhury",
    content: "Flutter continues to evolve, bringing more performance improvements and new features...",
    date: "August 18, 2024",
  ),
  BlogContent(
    title: "Why TypeScript is Essential for Backend Development",
    author: "John Doe",
    content: "TypeScript has become a favorite choice for backend developers due to its static typing...",
    date: "August 15, 2024",
  ),
  BlogContent(
    title: "Mastering Firebase for Full-Stack Apps",
    author: "Jane Smith",
    content: "Firebase provides an excellent backend solution for full-stack apps with authentication, database, and hosting...",
    date: "August 10, 2024",
  ),
  BlogContent(
    title: "Understanding MVC Architecture in Flutter",
    author: "Alex Johnson",
    content: "MVC architecture helps developers keep their Flutter apps clean, modular, and scalable...",
    date: "August 5, 2024",
  ),
  BlogContent(
    title: "How to Optimize Flutter Apps for Performance",
    author: "Sarah Lee",
    content: "Performance optimization is key to building smooth and responsive Flutter applications...",
    date: "August 1, 2024",
  ),
  BlogContent(
    title: "Building a REST API with Node.js and Express",
    author: "Michael Brown",
    content: "Learn how to build a scalable REST API using Node.js and Express for backend applications...",
    date: "July 28, 2024",
  ),
  BlogContent(
    title: "Top 10 Tips for Writing Clean Dart Code",
    author: "Emily Davis",
    content: "Writing clean and maintainable Dart code is essential for large-scale Flutter applications...",
    date: "July 25, 2024",
  ),
  BlogContent(
    title: "Integrating MongoDB with Flutter Apps",
    author: "Daniel Wilson",
    content: "Learn how to connect MongoDB with your Flutter applications using REST APIs...",
    date: "July 20, 2024",
  ),
  BlogContent(
    title: "Best UI/UX Practices for Mobile App Design",
    author: "Sophia White",
    content: "Creating a user-friendly mobile app requires a strong focus on UI/UX design principles...",
    date: "July 15, 2024",
  ),
  BlogContent(
    title: "How to Implement Dark Mode in Flutter",
    author: "David Miller",
    content: "Dark mode is a popular feature in mobile apps. Learn how to implement it in Flutter...",
    date: "July 10, 2024",
  ),
];
