/**
 * Various functions
 */

 void setupScenes(){
   currentScene = theScenes.get(currentSceneIndex);
   println("Current scene chosen : "+currentSceneIndex);
   for(Scene s : theScenes){
     s.setSceneDimensions();
     s.setup();
   }
 }

 void clearScene(){
   background(0,0,33);
 }

 void keyPressed(){

   if(keyCode == RIGHT){
     // get next scene
     if (currentSceneIndex <theScenes.size()-1) {
       currentSceneIndex++;
       currentScene = theScenes.get( theScenes.indexOf(currentScene)+1 );
     }
   }

   if(keyCode == LEFT){
     // get prev scene
     if (currentSceneIndex > 0) {
       currentSceneIndex--;
       currentScene = theScenes.get(
         theScenes.indexOf(currentScene)-1 );
     }
   }

   if(key == 'r'){
     // get random scene
   }

   if(key == 'i'){
    showSettings = !showSettings;
   }
 }
