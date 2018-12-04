package test;
import x10.regionarray.Dist;
import x10.regionarray.*;
import x10.regionarray.Region;
import x10.regionarray.DistArray;
public class Test_ghost {
	
    public static def main(args: Rail[String]) {
    	val dist=Dist.makeBlockBlock(Region.make(0..9,0..9));
    	val dArray=DistArray.make[Long](dist,(p:Point(2)) =>p(0)*p(1));
    	Console.OUT.println("ʵ��ǰ��");
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
    	Console.OUT.println("ʵ���");
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
    Console.OUT.println("ʵ��BolckBolckDist:");
    val reg=Region.make(0..4,0..4);
    val r=Dist.makeBlockBlock(reg, 0, 1);
    //r��Dist���ͣ�-1��init:T ��ɳ�ʼ����5��ghostWidth��trueû�������
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
    Console.OUT.println("���ÿ��place�е�point��");
    finish for(p in a.dist.places()){
    	async at(p){ 
    		for(point in a|here){
    			Console.OUT.print(here+":"+point+"="+a(point)+ " ");
    		}
    		Console.OUT.println();
    	}
    }
    //��ӡ��ÿ��place�е�region
    Console.OUT.println("��ӡ��ÿ��place�е�region��");
    finish for(p in a.dist.places()){
    	async at(p){
    Console.OUT.println(r(here));
    }
    }
    //ʵ��ghostRegion
    Console.OUT.println("ʵ��ghostRegion��");
    finish for (place in a.dist.places()) at(place) async {
    	// every place sets each point in its locally held region to its place ID
    	val regionHere = r(here);
    	finish for (p in regionHere) {
    		a(p) = here.id;
    	}
    	Console.OUT.println("��ӡÿ��place�е�distarray��Ԫ��");
    	finish for (p in regionHere) {
    		Console.OUT.println(here+":"+p+"="+a(p));
    	}
    	finish{
    	Console.OUT.println("��ӡÿ��place�е�ghost��Ԫ��");
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