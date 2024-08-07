/*
 Shuffled Endless Mode Course Creator by julz, July 2024
 
 This sketch is meant to provide an easy way to create an "endless" mode from
 a folder of songs that includes ALL songs in that folder.
 
 Simply replace "myFolder" on lines 23 & 38 in this sketch with the name of the
 folder containing your songs. If your song and course folders are not in the default
 locations you will need to update those paths as well. After the sketch finishes
 creating the course, reload the songs/courses from the Options menu in SM and the
 course should appear in Extended Mode.
 
 This code may work for other versions of SM/ITG/Outfox etc. but I have only tested
 it with StepMania v5.0.12
 
*/

import java.util.Date;
PrintWriter output;
StringList songs;

void setup() {
  String path = "C:\\Games\\StepMania 5\\Songs\\myFolder";

  println("Listing all filenames in a directory: ");
  String[] filenames = listFileNames(path);
  printArray(filenames);
  songs = new StringList();
  for (int i = 0; i < filenames.length; i++) {
    songs.append(filenames[i]);
  }
  songs.shuffle();
  printArray(songs);

  output = createWriter("C:\\Games\\StepMania 5\\Courses\\Default\\endless shuffle.crs");
  output.println("#COURSE:endless shuffle;");
  for (int i = 0; i < songs.size(); i++) {
    output.println("#SONG:myFolder/"+songs.get(i)+":Medium;");
  }

  output.flush();
  output.close();
  exit();

  noLoop();
}

void draw() {
}

String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}
