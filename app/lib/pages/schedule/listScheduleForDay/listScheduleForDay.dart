import 'package:app/class/group.dart';
import 'package:app/class/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListScheduleForDayPage extends StatefulWidget {
  const ListScheduleForDayPage({super.key});

  @override
  State<ListScheduleForDayPage> createState() => _ListScheduleForDayPageState();
}

class _ListScheduleForDayPageState extends State<ListScheduleForDayPage> {
  @override
  void initState() {
    super.initState();
  }

  void _showLessonMenu(BuildContext context, Lesson lesson) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                lesson.subject.subject,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text(
                '${lesson.teacher.middleName} ${lesson.teacher.firstName} ${lesson.teacher.lastName}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Text(
                'Кабинет: ${lesson.room.roomName}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(AppLocalizations.of(context)!.close),
              ),
            ],
          ),
        );
      },
    );
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
                                        (e) => GestureDetector(
                                          onTap: () {
                                            _showLessonMenu(context, e);
                                          },
                                          child: Card(
                                            color: cardColor,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "${e.lessonNumber}.  ${e.subject.subject}",
                                                style: TextStyle(
                                                  color: textColor,
                                                ),
                                              ),
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
