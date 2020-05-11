enum Sky
{
  SUN, PARTIAL_CLOUD, CLOUD, RAIN, SNOW, SLEET, FOG
}

class TempAndSky {
  double temp;
  Sky sky;


TempAndSky (double t, int s){
    temp = t;
    if(s == 1 || s == 2){
      sky = Sky.SUN;
    } else if(s == 3 || s == 4){
      sky = Sky.PARTIAL_CLOUD;
    } else if(s > 4 && s < 7){
      sky = Sky.CLOUD;
    } else if(s == 7) {
      sky = Sky.FOG;
    } else if( (s>7&&s<12) || (s > 17 && s < 22)){
      sky = Sky.RAIN;
    } else if((s > 14 && s < 18) || (s > 24)){
      sky = Sky.SNOW;
    } else if((s > 11 && s < 15) || (s > 21 && s < 25)){
      sky = Sky.SLEET;
    }
  }

  double getTemp(){
    return temp;
  }

  Sky getSky(){
    return sky;
  }

}