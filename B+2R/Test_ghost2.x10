package test;
/**
 * ����distArray�е�point�ı��Ƿ�Ӱ��ghost
 */
import x10.regionarray.*;
public class Test_ghost2 {
    public static def main(args: Rail[String]) {
    	//����region
    	val reg=Region.make(0..3,0..3);
    	//����dist
    	val r=Dist.makeBlockBlock(reg, 0, 1);
    	//r��Dist���ͣ�-1��init:T ��ʼ��ghost����2��ghostWidth��trueû�������
    	val a = DistArray.make[long](r, -1, 2, true);
    	Console.OUT.println("Dist:"+r);
    	Console.OUT.println("------------------------");
    	Console.OUT.println("**��ӡĬ��ֵ��Ĭ��ֵΪ-1:");
    	finish for(p in Place.places()){
    		async at(p){
    			val localRegion = r(here);
    			for(point in localRegion){
    				Console.OUT.println(here+":"+a(point));
    			}
    		}
    	}
    	//��point��ֵ��Ϊ�����place��������ӡDistarray����Ԫ��
    	Console.OUT.println("------------------------");
    	Console.OUT.println("**��point��ֵ��Ϊ�����place��������ӡ:");
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
    	//��ӡplace0�е�Ԫ��
    	Console.OUT.println("**��ӡplace0�е�Ԫ�أ�");
    	finish for(point in r){
    		Console.OUT.println(here+":"+point+"="+a(point));
    	}
    	Console.OUT.println("**��ӡghost------------------------");
          //��ӡghost
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
    Console.OUT.println("**����ghost��ֵ------------------------");
    /*����������⣺���ܸ�ghost�����ֵ*/
    finish for (place in Place.places()) {
    	at (place)  async {
    		val ghostRegion = a.localRegion();   				
    		for(p in ghostRegion){  
    			a(p)=here.id; 					
    		}
    	}
    }
    Console.OUT.println("**�鿴���ĺ�ghost��ֵ------------------------");
    finish for (place in Place.places()) {
    	at (place) async {
    		val ghostRegion = a.localRegion();   				
    		for(p in ghostRegion){  
    			Console.OUT.println(here+":"+p+"="+a(p)+ " "); 					
    		}
    	}
    }
    // Console.OUT.println("**�鿴���ĺ󱾵�distarray��ֵ------------------------");
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