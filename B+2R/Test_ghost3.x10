package test;
/*
 * 测试ghost区域的数值怎么变
 */
import x10.regionarray.*;
public class Test_ghost3 {
    public static def main(args: Rail[String]) {
    	//创建region
    	val reg=Region.make(0..3,0..3);
    	//创建dist
    	val r=Dist.makeBlockBlock(reg, 0, 1);
    	//r是Dist类型，-1是init:T 初始化ghost区域，2是ghostWidth，true没搞清楚？
    	val a = DistArray.make[long](r, -1, 2, true);
    	//这是取ghost区域的数
    	clocked finish {
    		for (place in Place.places()) {
    			at (place) clocked async {
    				val ghostRegion = a.localRegion();   				
    				Console.OUT.println(here+" :"+"ghostRegion:"+ghostRegion+" localRegion:"+r(here));
    				Clock.advanceAll();
    				for(p in ghostRegion){  
    					Console.OUT.println(here+":"+p+"="+a(p)+ " "); 					
    				}
    				Clock.advanceAll();	
    				//改ghost里的数
    				Console.OUT.println("更改并显示ghost："); 	
    				for(p in ghostRegion){  
    					a(p)=here.id; 					
    				}
    				for(p in ghostRegion){  
    					Console.OUT.println(here+":"+p+"="+a(p)); 					
    				}
    				
    				
    			}
    		}         
    	}
    	//如何改ghost区域的数
    	
    	
    }
}