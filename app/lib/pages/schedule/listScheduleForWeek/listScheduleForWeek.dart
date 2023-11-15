import 'package:app/class/group.dart';
import 'package:flutter/material.dart';

class ListScheduleForWeekPage extends StatefulWidget {
  const ListScheduleForWeekPage({super.key});

  @override
  State<ListScheduleForWeekPage> createState() => _ListScheduleForWeekPageState();
}

class _ListScheduleForWeekPageState extends State<ListScheduleForWeekPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColor =
        brightness == Brightness.dark ? Colors.white : Colors.white;
    final cardColor =
        brightness == Brightness.dark ? Colors.grey[800] : Colors.blue;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
          future: Group.getFetchAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data![index].groupName.toString(),
                            style: TextStyle(color: textColor),
                          ),
                          FutureBuilder(
                            future: snapshot.data![index].getTodayTimetable(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: snapshot.data!
                                      .map(
                                        (e) => Card(
                                          color: cardColor, // Set card color based on theme
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              e.id.toString() +
                                                  "  " +
                                                  e.lessonType.toString(),
                                              style: TextStyle(color: textColor),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                );
                              } else {
                                return CircularProgressIndicator();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
