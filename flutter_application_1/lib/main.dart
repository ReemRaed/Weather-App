import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/Models/weatherModel.dart';
import 'package:flutter_application_1/Providers/weatherProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return weatherProvider();
      },
      child: MaterialApp(
        home: Search(),
      ),
    );
  }
}

class Search extends StatelessWidget {
  Search({super.key});
  weatherModel? weather;

  @override
  Widget build(BuildContext context) {
    weather = Provider.of<weatherProvider>(context).WeatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        leading: Icon(Icons.ac_unit),
        actions: [
          IconButton(
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Home();
                    }))
                  },
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(
          color: Colors.orange,
          child: Center(
            child: Column(children: [
              Spacer(
                flex: 3,
              ),
              Center(
                child: Text("cairo",
                    style: TextStyle(fontSize: 30, color: Colors.black)),
              ),
              Text(
                weather?.date ?? "",
                style: TextStyle(fontSize: 30),
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: NetworkImage(
                        "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHoAAAB6CAMAAABHh7fWAAAAZlBMVEX////4qAX1xSX4pgD0wQD1xB73sBH1xyb3sxT1wiL4qgj1wxT//vr++vD++Oj98tf2vB32thj413z53pT2y0n757P41HD41nf99uL524j1xzD646T30mr88ND30WP87sr3zlP868I3zXZdAAAElklEQVRogdWb6XaqMBCASxrWoCyCWJVW3/8lbxCELAMSSZxz50d7Go98nTCZJZl8ff030r71kQ3Zs2YHf5I2bO8U/cNYlUEfZBVjPy7Je0aIT2v9g5r6hDhVu+RoQmijjje0G2elO/L+QeCMszTp2Zn149Sd2ke/R/BJv0yjFzoOH12Rs0Hph4LXtB9Mr+IoaIIW5MgmyHPSx8nuB69uyK2g3nPSp8ke1HbjV35lSmfpDVWG/F8X5D8Vw+eXaUP0bytnd6izVB6qVKVB8SvlSVl9mHG9M7JnlPlVWbfjSq11pUGZfN2urX8qnz/IbLXvOxW7r52r46U9pWuV7tVOT1ndVOfu3+9GDNHjW+R8SqpjuZLcudPmRmhP7QfM0CfZgHzAoObZTP432ckMvfLNrhFqhs5eo0Pp1xLazLu2i+iQxHleRFEQRFGR5/Ey39DDLaDjvAg8z/vm8vjxzf9IijyexRuiAdfVq5sH3gOmCB8L5uiGDu4OoMMwjhIAO+K9KAbRdyM05LviANJX1j0A4FAuZ4Tm4GXuQNfhhuiLii5WgR/wQnnlYjJljo6X3rHGTuIt6IOELtZzeykk9MEMLfrsyEDlQfFI+DozQKftRQiRK+1LYQcT2q8ObfqaygPH5crDpBB7TF6zwE4ENg/c18tyEDnVR0aVkPcOtxfpMV3YP9Yw/nQvu7SCKJK8j07UFc4YJeVdxR8qoqr7kHfe81PE9z3hecojF8MHOFyY27bEjsCHKottB6LXu7AZdgE9lSrJcQMkX/E2cCdANGFqdZ4B6A0m9pRED+FMy5e0imrzdHeiTzlQlWl5SWyBzNnqlAOJQ6qUF2Fgg+x5ygrzK8CnqnHSitKa2mAE3Z1dKK2qfQbLTsmt2FJaUXsmdu8FdLjNj0noSFhgc9tboluxsKZHmdTW3MlThEIrt6Y0VzuflJ4tv27j+rJmZJ2Mhubf5shTzWHBe4vynPGFOqR8vmyb8y3M+Oz+bXob37UN9y2gR0dOb+CyPk1bjqFN+/bE+MXOQHr2RwQfbpfsidkp0UreWszMLFuZlDH4TKn+5Nwst43OxafLzrSUo5ZdA5ecyoM9Gbpg2r2V2TVwve4dDf10VvMye7FjQKtZ8WDod6JlZc7RHHlXTNsRWs2SSH9ahohGnHBMM/vI4pLJ9JbiuxRUR4oZPtwGTWFbBQiacqpgNSvky3o5VcBMkL4Q00LUZBivBEAsfByVe0I+OlfuIRa5eKU94oaGvI0TfnAbR928srW+AjkPhjavtPO8z23Z4W1UAtuzNkrdRHuqvj2LtyntaCs+h56qbMW7OYCADj80t/LRYxfVozk4bNKw4GHTgMc5YhvxOAeLg8jHqW+977eOU3vBOkT+2nx0vljovBDEhoFNbRLKVw3RQF/Kp5pDEFtiwEYg8qIRKInALiTDRiC4/SkM46X2p5neL8P2p3VNX99D01fSNX3NfsFevxmZWt06sd7qhtjgh9jWiNjMidjCitq4i9aujNikDcinWtMhwWvIx7yGgHj5AvPKCeJFG8zrRYiXqjCvkiFeoMO8Noh4WdKm/ANYhmqhdOpcTwAAAABJRU5ErkJggg=="),
                    width: 100,
                  ),
                  Text('${weather?.temp.toInt()}',
                      style: TextStyle(fontSize: 20)),
                  Column(
                    children: [
                      Text('max:${weather?.maxTemp.toInt()}'),
                      Text('min:${weather?.maxTemp.toInt()}')
                    ],
                  )
                ],
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                "Clear",
                style: TextStyle(fontSize: 30),
              ),
              Spacer(
                flex: 3,
              )
            ]),
          )),
    );
  }
}
