package test;
import x10.regionarray.Dist;
import x10.regionarray.*;
import x10.regionarray.Region;
import x10.regionarray.DistArray;
public class Test_ghost {
	
    public static def main(args: Rail[String]) {
    	val dist=Dist.makeBlockBlock(Region.make(0..9,0..9));
    	val dArray=DistArray.make[Long](dist,(p:Point(2)) =>p(0)*p(1));
    	Console.OUT.println("实验前：");
    	Console.OUT.println("dist:"+dArray.getDist());
    	finish for(p in dArray.dist.places()){
    		at(p){
    			Console.OUT.println("this is "+here);
    			for(point in dArray|here ){
    				Console.OUT.print(point+"="+dArray(point)+" ");
    			}
    			Console.OUT.println();
    		}
    	}
    	val newdArray=DistArray.make[long](dist,(p:Point(2)) =>p(0)*p(1),10,true);
    	Console.OUT.println("实验后：");
    	Console.OUT.println("dist:"+newdArray.getDist());
    	finish for(p in newdArray.dist.places()){
    		at(p){
    			Console.OUT.println("this is "+here);
    			for(point in newdArray|here ){
    				Console.OUT.print(point+"="+newdArray(point)+" ");
    			}
    			Console.OUT.println();
    		}
    	}
    Console.OUT.println("实验BolckBolckDist:");
    val reg=Region.make(0..4,0..4);
    val r=Dist.makeBlockBlock(reg, 0, 1);
    //r是Dist类型，-1是init:T 完成初始化，5是ghostWidth，true没搞清楚？
    val a = DistArray.make[long](r, -1, 5, true);
    Console.OUT.println("Dist:"+r);
//     finish for (place in a.dist.places()) at(place) async {
//     	// every place sets each point in its locally held region to its place ID
//     	val regionHere = r(here);
//     	for (p in regionHere) {
//     		a(p) = here.id;
//     	}
// 
//     }
//     finish for (place in a.dist.places()) at(place) async {
//     	val regionHere = r(here);
//      for (p in a.dist.places()|here){
//     	Console.OUT.println(here+": ");
//     	for (p in regionHere) {
//     		Console.OUT.println("a"+p+"= "+a(p));
//     	}
//     }
// }
    Console.OUT.println("输出每个place中的point：");
    finish for(p in a.dist.places()){
    	async at(p){ 
    		for(point in a|here){
    			Console.OUT.print(here+":"+point+"="+a(point)+ " ");
    		}
    		Console.OUT.println();
    	}
    }
    //打印出每个place中的region
    Console.OUT.println("打印出每个place中的region：");
    finish for(p in a.dist.places()){
    	async at(p){
    Console.OUT.println(r(here));
    }
    }
    //实验ghostRegion
    Console.OUT.println("实验ghostRegion：");
    finish for (place in a.dist.places()) at(place) async {
    	// every place sets each point in its locally held region to its place ID
    	val regionHere = r(here);
    	finish for (p in regionHere) {
    		a(p) = here.id;
    	}
    	Console.OUT.println("打印每个place中的distarray的元素");
    	finish for (p in regionHere) {
    		Console.OUT.println(here+":"+p+"="+a(p));
    	}
    	finish{
    	Console.OUT.println("打印每个place中的ghost的元素");
    val ghostRegion = a.localRegion();
    Console.OUT.println(here+" :");
    Console.OUT.println(ghostRegion);
    finish for(p in ghostRegion){  
    		Console.OUT.println(here+":"+p+"="+a(p)+ " ");
    }
    }
    	}
    }
    }