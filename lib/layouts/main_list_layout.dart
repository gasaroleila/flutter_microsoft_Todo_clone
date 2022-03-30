import 'package:flutter/material.dart';
import 'package:flutter_microsoft_todo_clone/models/models.dart';
import 'package:flutter_microsoft_todo_clone/utils/palette.dart';
import 'package:flutter_microsoft_todo_clone/widgets/widgets.dart';

class MainListLayout extends StatelessWidget {
  final List<ToDo> data;
  final String title;
  final bool isMyDay;
  final Icon headerIcon;
  const MainListLayout(
      {Key? key,
      required this.data,
      required this.title,
      this.isMyDay = false,
      this.headerIcon =
          const Icon(Icons.lightbulb, size: 25, color: Colors.white)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusBar = MediaQuery.of(context).padding.top;
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(24, statusBar + 12, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: IconButton(
                      alignment: Alignment.topLeft,
                      icon:
                          const Icon(Icons.menu, color: Colors.white, size: 32),
                      onPressed: () => {},
                    ),
                  ),
                ),
                Column(
                  children: [
                    AppHeader(
                      title: title,
                      isMyDay: isMyDay,
                    ),
                    TaskList(
                      todos: data,
                      isMain: true,
                    ),
                    const AddTask()
                  ],
                ),
              ],
            )),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.85,
          color: Colors.black,
          child: _AppSideBar(),
        )
      ],
    );
  }
}

class _AppSideBar extends StatelessWidget {
  const _AppSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(16, 30, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            alignment: Alignment.topLeft,
            icon: const Icon(Icons.menu, color: Colors.white, size: 32),
            onPressed: () => {},
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    width: 60,
                    height: 60,
                    alignment: Alignment.center,
                    child: const Text(
                      'GL',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                  ),
                ),
                Flex(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  direction: Axis.vertical,
                  children: const [
                    Text(
                      'Gasaro Leila',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Text(
                      'uwamgaleila@gmail.com',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 17),
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.white,
                  ),
                  suffixIconColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  filled: true,
                  fillColor: Palette.mainBlack,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(7)),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 18)),
            ),
          ),

          _AppMenu()
        ],
      ),
    );
  }
}

class _AppMenu extends StatelessWidget {
  const _AppMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
