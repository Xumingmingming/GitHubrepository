package test;
/*
 * ����ghost�������ֵ��ô��
 */
import x10.regionarray.*;
public class Test_ghost3 {
    public static def main(args: Rail[String]) {
    	//����region
    	val reg=Region.make(0..3,0..3);
    	//����dist
    	val r=Dist.makeBlockBlock(reg, 0, 1);
    	//r��Dist���ͣ�-1��init:T ��ʼ��ghost����2��ghostWidth��trueû�������
    	val a = DistArray.make[long](r, -1, 2, true);
    	//����ȡghost�������
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
    				//��ghost�����
    				Console.OUT.println("���Ĳ���ʾghost��"); 	
    				for(p in ghostRegion){  
    					a(p)=here.id; 					
    				}
    				for(p in ghostRegion){  
    					Console.OUT.println(here+":"+p+"="+a(p)); 					
    				}
    				
    				
    			}
    		}         
    	}
    	//��θ�ghost�������
    	
    	
    }
}