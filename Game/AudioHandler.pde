class AudioHandler {
  AudioPlayer audio;
  Minim minim;
  float gain;
  public AudioHandler(Game game) {
    minim = new Minim(game);
    audio = minim.loadFile("Sound/track1.mp3");
    audio.loop();
    gain = 0;
  }
  AudioPlayer getAudio(){
    return audio;
  }
  void mainVolUp(){
    gain = constrain(gain + 8, -80, 0);
    audio.setGain(gain);
  }
  void mainVolDown(){
    gain = constrain(gain - 8, -80, 0);
    audio.setGain(gain);
  }
  void mute(){
    audio.mute();
  }
  void unmute(){
    audio.unmute();
  }
}