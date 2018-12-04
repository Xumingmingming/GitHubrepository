package test;
import x10.regionarray.*;
public class TestBBDGhostManager {
	
	public static def main(var args: Rail[String]) {	//创建region
	val reg=Region.make(0..3,0..3);
	//创建dist
	val r=Dist.makeBlockBlock(reg, 0, 1);
	//ghost的长度
	val ghostWidth = 2;
	
	clocked finish for(place in r.places())  at (place) clocked async {
		val localRegion = r(here);
		val ghostMgr = r.getLocalGhostManager(ghostWidth, true);
		val ghostRegion = ghostMgr.getGhostRegion(here);
		Console.OUT.println(here+": localRegion="+localRegion);
		Console.OUT.println(here+": ghostRegion="+ghostRegion);
		Clock.advanceAll();
		//Console.OUT.println(here+"***getNeighbors():"+ghostMgr.getNeighbors()(here.id));
		Console.OUT.println("----------------------");
		val neighbors = ghostMgr.getNeighbors();
		Console.OUT.println(here+": neighbors="+neighbors);
		Clock.advanceAll();
		Console.OUT.println("----------------------");
		finish for (neighbor in neighbors) {
			val ghostRegion2 = ghostMgr.getGhostRegion(neighbor);
			val overlap = localRegion.intersection(ghostRegion2);
			Console.OUT.println(here+" :localRegion="+localRegion+"---neighbor:"+neighbor+"ghostRegion2="+ghostRegion2+" overlap="+overlap);
		}
		Clock.advanceAll();	
		// Clock.advanceAll();
		// Console.OUT.println("***localRegion---------------");
		// finish for(p in localRegion){
		// 	Console.OUT.println(here+":"+p);
		// }
		// Clock.advanceAll();
		// Console.OUT.println("***ghostRegion---------------");
		// finish for(p in ghostRegion){
		// 	Console.OUT.println(here+":"+p);
		// }
		// Clock.advanceAll();
	}
	Console.OUT.println("得到指定place中的ghostregion----------------------");
	val ghostMgr = r.getLocalGhostManager(ghostWidth, true);
	finish for(p in Place.places()){
		Console.OUT.println(p+" "+ghostMgr.getGhostRegion(p));
	}
	
	//
	// Console.OUT.println("***各个place中的ghostManager---------------");
	// finish for(place in r.places())  at (place) async {
	// 	val PlacesghostMgr = r.getLocalGhostManager(ghostWidth, true);
	// 	Console.OUT.println(here+" PlacesghostMgr:"+PlacesghostMgr);
	// }
	
	
   }
}
