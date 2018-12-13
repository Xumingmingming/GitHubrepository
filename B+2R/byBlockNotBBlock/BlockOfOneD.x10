package byBlockNotBBlock;
import x10.regionarray.Dist;
import x10.regionarray.Region;
import x10.regionarray.DistArray;
public class BlockOfOneD {
	public static def main(args: Rail[String]) {
		//测试的是：一维的Region，makeBlock一次
		// val Block=Dist.makeBlock(Region.make(0..9));
		// val Block2=Dist.makeBlock(Region.make(0..10));
		// val Block3=Dist.makeBlock(Region.make(0..11));
		// val DistArray1=DistArray.make[long](Block,([i]:Point) => i);
		// Console.OUT.print("DistArray1分配的Places:");
		// Console.OUT.println(DistArray1.dist.places());
		// Console.OUT.print("DistArray1分配的Places个数:");
		// Console.OUT.println(DistArray1.dist.numPlaces());
		// Console.OUT.println("Block:"+Block);
		// Console.OUT.println("Block2:"+Block2);
		// Console.OUT.println("Block3:"+Block3);
		// //DistArray一维
		// finish for(p in DistArray1.dist.places()){
		// 	 at(p){ 
		// 		for(point in DistArray1|here){
		// 			Console.OUT.println(here+":"+DistArray1(point));
		// 		}
		// 	}
		// }
		
		//2维的Region，makeBlock一次
		//在DistArray在各Place中是如何分布的按行还是按列？
		Console.OUT.println("二维分布式数组:");
		val reg=Region.make(0..5,0..5);
		val Block=Dist.makeBlock(reg);
		val DistArray2=DistArray.make[long](Block,(p:Point(2)) =>p(0)*p(1));
		// Console.OUT.println(here+":"+[0,0]);
		// Console.OUT.println(here+":"+"DistArray2(0,0):"+DistArray2(0,0));
		// Console.OUT.println("Block:"+Block);
		// Console.OUT.println("分布式数组循环迭代：");
		// finish for(p in DistArray2.dist.places()){
		// 	at(p){ 
		// 		for(point in DistArray2|here){
		// 			Console.OUT.print(here+":"+point+"="+DistArray2(point)+" ");
		// 		}
		// 		Console.OUT.println();
		// 	}
		// 	
		// }
		
		//测试
	// 	Console.OUT.println("**测试:");
	// 	Console.OUT.println("reg="+reg);
	// 	Console.OUT.println("DistArray2.region()="+DistArray2.region());
	// 	Console.OUT.println("Block="+Block);
	// 	Console.OUT.println("DistArray2="+DistArray2);
	// 	Console.OUT.println("Block.regions()="+Block.regions());
	// 	Console.OUT.println("**Dist的get()方法：");
 //       finish for(p in DistArray2.dist.places()){
 //    	   	at(p){ 
 //    	   	Console.OUT.println(here+":"+Block.get(p)); 	   		
 //       }		
	// }
       
       /**
        * 实验1:求每个block中x轴和y轴的上限和下限
        * 
        * Region中的 min(0)：返回x轴最下界
        * Region中的 min(1)：返回y轴最下界
        * Region中的 max(0)：返回x轴最上界
        * Region中的 max(1)：返回y轴最上界
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
        * 实验2：确定一维分隔中，place的分布，达到精确取place的目的
        * 
        * 涉及到的类：
        * 
        */
		Console.OUT.println("**PlaceGroup：next(Place p)");
       finish for(p in DistArray2.dist.places()){
    	   at(p){ 
    		   Console.OUT.println("当前place："+p+" ---- "+"后一个place："+Place.places().next(p));   		
    	   }		
       }
       Console.OUT.println("**PlaceGroup：prev(Place p)");
       finish for(p in DistArray2.dist.places()){
    	   at(p){ 
    		   Console.OUT.println("当前place："+p+" ---- "+"后一个place："+Place.places().prev(p));   		
    	   }		
       }
       
  	   			
       
}
}