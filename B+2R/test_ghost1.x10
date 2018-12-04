package test;
/**
 * 实验目的：探究ghost怎么分配
 */
import x10.regionarray.*;
public class test_ghost1 {
	
    public static def main(args: Rail[String]) {
    	//创建region
    	val reg=Region.make(0..4,0..4);
    	//创建dist
    	val r=Dist.makeBlockBlock(reg, 0, 1);
    	//r是Dist类型，-1是init:T 初始化ghost区域，5是ghostWidth，true没搞清楚？
    	val a = DistArray.make[long](r, -1, 5, true);
    	Console.OUT.println("Dist:"+r);
    	Console.OUT.println("显示DistArray各place中的元素:");
    	finish for (place in a.dist.places()) at(place) async {
    		Console.OUT.print("****");
    		for(point in a|here){
    			Console.OUT.print(here+":"+point+"="+a(point)+ " ");
    		}
    	}
    	Console.OUT.println();
    	Console.OUT.println("显示DistArray的ghost区域:");
    	clocked finish {
    		for (place in Place.places()) {
    			at (place) clocked async {
    				val ghostRegion = a.localRegion();   				
    				Console.OUT.println(here+" :");
    				Clock.advanceAll();
    				Console.OUT.println("ghostRegion:"+ghostRegion);
    				Clock.advanceAll();
    				for(p in ghostRegion){  
    					Console.OUT.println(here+":"+p+"="+a(p)+ " "); 					
    				}
    				Clock.advanceAll();	
    			}
    		}
    	}
    }
}