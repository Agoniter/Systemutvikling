class AudioHandler {
  AudioPlayer audio;
  AudioPlayer[] sfx;
  Minim minim;
  float gain;
  public AudioHandler(Game game) {
    minim = new Minim(game);
    audio = minim.loadFile("Sound/track1.mp3");
    audio.loop();
    gain = 0;
    sfx = new AudioPlayer[10];
    sfx[0] = minim.loadFile("Sound/SFX/pistol.wav");
    sfx[1] = minim.loadFile("Sound/SFX/assaultrifle.wav");
    sfx[2] = minim.loadFile("Sound/SFX/shotgun.wav");
    sfx[3] = minim.loadFile("Sound/SFX/basetakedamage.wav");
    sfx[4] = minim.loadFile("Sound/SFX/enemytakedamage.wav");
    sfx[5] = minim.loadFile("Sound/SFX/gameover.wav");
    sfx[6] = minim.loadFile("Sound/SFX/grenade.wav");
    sfx[7] = minim.loadFile("Sound/SFX/levelcomplete.wav");
    sfx[8] = minim.loadFile("Sound/SFX/playertakedamage.wav");
    sfx[9] = minim.loadFile("Sound/SFX/win.wav");
    
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
  void sfxPlay(int sfxNum){
    sfx[sfxNum].play();
    sfx[sfxNum].rewind(); 
  }
}