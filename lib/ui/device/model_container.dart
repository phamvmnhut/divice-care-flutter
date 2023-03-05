import 'package:divice/business/device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModelContainer extends StatefulWidget {
  final String deviceID;
  const ModelContainer({
    super.key,
    required this.deviceID,
  });

  @override
  State<ModelContainer> createState() => _ModelContainerState();
}

class _ModelContainerState extends State<ModelContainer> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<DeviceBloc>(context, listen: false)
        .add(DeviceEventGetListModel(deviceID: widget.deviceID));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceBloc, DeviceState>(builder: (context, state) {
      if (state.listModel[widget.deviceID] == null) {
        return const CircularProgressIndicator();
      }
      return Column(
          children: state.listModel[widget.deviceID]!
              .map(
                (model) => Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: ExpansionTile(
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    title: Text(
                      model.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.count.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xFF9B9B9B)),
                        ),
                        const Divider(color: Colors.black),
                      ],
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ListTile(title: Text('Item 01')),
                            const ListTile(title: Text('Item 02')),
                            const ListTile(title: Text('Item 03')),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF1BD15D)),
                                  onPressed: () => print('object'),
                                  child: const Text('Thêm mới')),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1BD15D)),
                            onPressed: () => print('object2'),
                            child: const Text('Thêm mới')),
                      ),
                    ],
                  ),
                ),
              )
              .toList());
    });
  }
}
