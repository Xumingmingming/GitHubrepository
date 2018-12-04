package test;
/**
 * 测试distArray中的point改变是否影响ghost
 */
import x10.regionarray.*;
public class Test_ghost2 {
    public static def main(args: Rail[String]) {
    	//创建region
    	val reg=Region.make(0..3,0..3);
    	//创建dist
    	val r=Dist.makeBlockBlock(reg, 0, 1);
    	//r是Dist类型，-1是init:T 初始化ghost区域，2是ghostWidth，true没搞清楚？
    	val a = DistArray.make[long](r, -1, 2, true);
    	Console.OUT.println("Dist:"+r);
    	Console.OUT.println("------------------------");
    	Console.OUT.println("**打印默认值，默认值为-1:");
    	finish for(p in Place.places()){
    		async at(p){
    			val localRegion = r(here);
    			for(point in localRegion){
    				Console.OUT.println(here+":"+a(point));
    			}
    		}
    	}
    	//将point的值改为对象的place数，并打印Distarray所有元素
    	Console.OUT.println("------------------------");
    	Console.OUT.println("**将point的值改为对象的place数，并打印:");
    	finish for(p in Place.places()){
    		async at(p){
    			for(point in r|here){
    				a(point)=here.id;
    			}
    		}
    	}
    	finish for(p in Place.places()){
    		async at(p){
    			for(point in r|here){
    				Console.OUT.println(here+":"+a(point));
    			}
    		}
    	}
    	Console.OUT.println("------------------------");
    	//打印place0中的元素
    	Console.OUT.println("**打印place0中的元素：");
    	finish for(point in r){
    		Console.OUT.println(here+":"+point+"="+a(point));
    	}
    	Console.OUT.println("**打印ghost------------------------");
          //打印ghost
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
    }
    }         
    }
    Console.OUT.println("**更改ghost的值------------------------");
    /*这出现了问题：不能改ghost区域的值*/
    finish for (place in Place.places()) {
    	at (place)  async {
    		val ghostRegion = a.localRegion();   				
    		for(p in ghostRegion){  
    			a(p)=here.id; 					
    		}
    	}
    }
    Console.OUT.println("**查看更改后ghost的值------------------------");
    finish for (place in Place.places()) {
    	at (place) async {
    		val ghostRegion = a.localRegion();   				
    		for(p in ghostRegion){  
    			Console.OUT.println(here+":"+p+"="+a(p)+ " "); 					
    		}
    	}
    }
    // Console.OUT.println("**查看更改后本地distarray的值------------------------");
    // finish for (place in Place.places()) {
    // 	at (place) async {
    // 		val localRegion = r(here);   				
    // 		for(p in localRegion){  
    // 			Console.OUT.println(here+":"+p+"="+a(p)+ " "); 					
    // 		}
    // 	}
    // }
    
}
    }