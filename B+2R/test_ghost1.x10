package test;
/**
 * ʵ��Ŀ�ģ�̽��ghost��ô����
 */
import x10.regionarray.*;
public class test_ghost1 {
	
    public static def main(args: Rail[String]) {
    	//����region
    	val reg=Region.make(0..4,0..4);
    	//����dist
    	val r=Dist.makeBlockBlock(reg, 0, 1);
    	//r��Dist���ͣ�-1��init:T ��ʼ��ghost����5��ghostWidth��trueû�������
    	val a = DistArray.make[long](r, -1, 5, true);
    	Console.OUT.println("Dist:"+r);
    	Console.OUT.println("��ʾDistArray��place�е�Ԫ��:");
    	finish for (place in a.dist.places()) at(place) async {
    		Console.OUT.print("****");
    		for(point in a|here){
    			Console.OUT.print(here+":"+point+"="+a(point)+ " ");
    		}
    	}
    	Console.OUT.println();
    	Console.OUT.println("��ʾDistArray��ghost����:");
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