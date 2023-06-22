import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_flutter2/models/weather_model.dart';
import 'package:project_flutter2/services/weather_api_client.dart';
import 'package:project_flutter2/views/additonal_information.dart';
import 'package:project_flutter2/views/current_weather.dart';
class tienichPage extends StatefulWidget {
  const tienichPage({Key? key}) : super(key: key);

  @override
  State<tienichPage> createState() => _tienichPageState();
}

class _tienichPageState extends State<tienichPage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async{
    WidgetsFlutterBinding.ensureInitialized();
    data = await client.getCurrentWeather("VietNam");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xff06AB8D),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text('Tiện ích',style: TextStyle(fontSize: 25),),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25,),
                Align(
                  alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                  child: Text("Thời Tiết",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                SizedBox(height: 25,),
                currentWeather(Icons.wb_sunny_rounded,"${data!.temp}°c","${data!.cityName}"),
                SizedBox(height: 50,),
                Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xdd212121),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Divider(),tạo đường kẽ
                SizedBox(
                  height: 60,
                ),
                additionalInofrmation("${data!.wind}","${data!.humidity}",
                    "${data!.pressure}","${data!.feels_like}"),
                    // "${data!.temp_min}","${data!.temp_max}"),
                    // "${data!.sea_level}","${data!.grnd_level}",)
              ]
            );
          } else if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: Colors.teal,
              ),
            );
          }
            return Container();
        },
      ),
    );
  }
}
