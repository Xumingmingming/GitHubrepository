package byBlockNotBBlock;
import x10.regionarray.Dist;
import x10.regionarray.Region;
import x10.regionarray.DistArray;
public class BlockOfOneD {
	public static def main(args: Rail[String]) {
		//���Ե��ǣ�һά��Region��makeBlockһ��
		// val Block=Dist.makeBlock(Region.make(0..9));
		// val Block2=Dist.makeBlock(Region.make(0..10));
		// val Block3=Dist.makeBlock(Region.make(0..11));
		// val DistArray1=DistArray.make[long](Block,([i]:Point) => i);
		// Console.OUT.print("DistArray1�����Places:");
		// Console.OUT.println(DistArray1.dist.places());
		// Console.OUT.print("DistArray1�����Places����:");
		// Console.OUT.println(DistArray1.dist.numPlaces());
		// Console.OUT.println("Block:"+Block);
		// Console.OUT.println("Block2:"+Block2);
		// Console.OUT.println("Block3:"+Block3);
		// //DistArrayһά
		// finish for(p in DistArray1.dist.places()){
		// 	 at(p){ 
		// 		for(point in DistArray1|here){
		// 			Console.OUT.println(here+":"+DistArray1(point));
		// 		}
		// 	}
		// }
		
		//2ά��Region��makeBlockһ��
		//��DistArray�ڸ�Place������ηֲ��İ��л��ǰ��У�
		Console.OUT.println("��ά�ֲ�ʽ����:");
		val reg=Region.make(0..5,0..5);
		val Block=Dist.makeBlock(reg);
		val DistArray2=DistArray.make[long](Block,(p:Point(2)) =>p(0)*p(1));
		// Console.OUT.println(here+":"+[0,0]);
		// Console.OUT.println(here+":"+"DistArray2(0,0):"+DistArray2(0,0));
		// Console.OUT.println("Block:"+Block);
		// Console.OUT.println("�ֲ�ʽ����ѭ��������");
		// finish for(p in DistArray2.dist.places()){
		// 	at(p){ 
		// 		for(point in DistArray2|here){
		// 			Console.OUT.print(here+":"+point+"="+DistArray2(point)+" ");
		// 		}
		// 		Console.OUT.println();
		// 	}
		// 	
		// }
		
		//����
	// 	Console.OUT.println("**����:");
	// 	Console.OUT.println("reg="+reg);
	// 	Console.OUT.println("DistArray2.region()="+DistArray2.region());
	// 	Console.OUT.println("Block="+Block);
	// 	Console.OUT.println("DistArray2="+DistArray2);
	// 	Console.OUT.println("Block.regions()="+Block.regions());
	// 	Console.OUT.println("**Dist��get()������");
 //       finish for(p in DistArray2.dist.places()){
 //    	   	at(p){ 
 //    	   	Console.OUT.println(here+":"+Block.get(p)); 	   		
 //       }		
	// }
       
       /**
        * ʵ��1:��ÿ��block��x���y������޺�����
        * 
        * Region�е� min(0)������x�����½�
        * Region�е� min(1)������y�����½�
        * Region�е� max(0)������x�����Ͻ�
        * Region�е� max(1)������y�����Ͻ�
        */       
       // Console.OUT.println("Place(0):"); 
       // Console.OUT.print(Block.get(Place(0)).min(0)+" ");
       // Console.OUT.println(Block.get(Place(0)).max(0));
       // Console.OUT.print(Block.get(Place(0)).min(1)+" ");
       // Console.OUT.println(Block.get(Place(0)).max(1));
       // Console.OUT.println("Place(1):"); 
       // Console.OUT.print(Block.get(Place(1)).min(0)+" ");
       // Console.OUT.println(Block.get(Place(1)).max(0));
       // Console.OUT.print(Block.get(Place(1)).min(1)+" ");
       // Console.OUT.println(Block.get(Place(1)).max(1));
       // Console.OUT.println("Place(2):"); 
       // Console.OUT.print(Block.get(Place(2)).min(0)+" ");
       // Console.OUT.println(Block.get(Place(2)).max(0));
       // Console.OUT.print(Block.get(Place(2)).min(1)+" ");
       // Console.OUT.println(Block.get(Place(2)).max(1));
       // Console.OUT.println("Place(3):"); 
       // Console.OUT.print(Block.get(Place(3)).min(0)+" ");
       // Console.OUT.println(Block.get(Place(3)).max(0));
       // Console.OUT.print(Block.get(Place(3)).min(1)+" ");
       // Console.OUT.println(Block.get(Place(3)).max(1));
       
       /**
        * ʵ��2��ȷ��һά�ָ��У�place�ķֲ����ﵽ��ȷȡplace��Ŀ��
        * 
        * �漰�����ࣺ
        * 
        */
		Console.OUT.println("**PlaceGroup��next(Place p)");
       finish for(p in DistArray2.dist.places()){
    	   at(p){ 
    		   Console.OUT.println("��ǰplace��"+p+" ---- "+"��һ��place��"+Place.places().next(p));   		
    	   }		
       }
       Console.OUT.println("**PlaceGroup��prev(Place p)");
       finish for(p in DistArray2.dist.places()){
    	   at(p){ 
    		   Console.OUT.println("��ǰplace��"+p+" ---- "+"��һ��place��"+Place.places().prev(p));   		
    	   }		
       }
       
  	   			
       
}
}