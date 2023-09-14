import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:part_9/models/User.dart';
import 'package:part_9/models/User.dart';
import 'package:part_9/screens/UserDetailScreen.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

//объявление переменной списка с типом данных User
List<User> usersList = [
  User(
      age: 16,
      firstName: 'Иван',
      lastName: 'Иванов',
      phone: '2345435345',
      email: 'example@mail.ru',
      avatar:
          'https://bogatyr.club/uploads/posts/2023-03/1678992614_bogatyr-club-p-kot-v-kosmicheskikh-ochkakh-foni-vkontakte-41.jpg'),
  User(
      age: 16,
      firstName: 'Иван',
      lastName: 'Иванов',
      phone: '2345435345',
      email: 'example@mail.ru',
      avatar: ''),
  User(
      age: 16,
      firstName: 'Мария',
      lastName: 'Островская',
      phone: '2345435345',
      email: 'example@mail.ru',
      avatar: 'https://uprostim.com/wp-content/uploads/2021/05/image083-4.jpg'),
];

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailScreen(
                    user: usersList[index],
                  ),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 100.0,
                        width: 100.0,
                        child: usersList[index].avatar == ''
                            ? Image.network(
                                'http://cdn.onlinewebfonts.com/svg/img_207975.png')
                            : Image.network(usersList[index].avatar,
                                fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Имя: ' + usersList[index].firstName,
                              textAlign: TextAlign.left,
                            ),
                            Text('Фамилия: ' + usersList[index].lastName),
                            Text('Возраст: ' + usersList[index].age.toString()),
                            Text('Телефон: ' + usersList[index].phone),
                            Text('Email: ' + usersList[index].email),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
