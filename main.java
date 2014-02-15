import java.lang.* ;
import java.io.*;
import java.util.*;


class Drivers implements Runnable {
	String driveName;
	Drivers() throws Exception {
                ArrayList<String> pdvs = new ArrayList<String>(),temp= new ArrayList<String>() ;
		while(true){
                        //System.out.println("From the top"+pdvs);
                        temp= new ArrayList<String>();
                        String cmd = "ls -p /media/varun/" ;
			Runtime run = Runtime.getRuntime() ;
			Process pr = run.exec(cmd) ;
			pr.waitFor() ;
			BufferedReader buf = new BufferedReader( new InputStreamReader( pr.getInputStream() ) ) ;
			String line ;
			while ( (  line = buf.readLine() ) != null ) 
			{
				temp.add(line); ;
			}
                        for(int i=0;i<pdvs.size();i++){
                            int fl=0;
                            for(int j=0;j<temp.size();j++){
                                
                                if(pdvs.get(i).equals(temp.get(j))){temp.remove(j);fl=1;break;}
                            }
                            if(fl==1) continue;
                            pdvs.remove(i);
                        }
                        //System.out.println("Through the middle"+pdvs);
                        for(int i=0;i<temp.size();i++){
                            int fl=0;
                            for(int j=0;j<pdvs.size();j++){
                                if(pdvs.get(i).equals(temp.get(j))){fl=1;break;}
                            }
                            if(fl==1) continue;
                            Thread t = new Thread(this, "a process");
                            driveName = temp.get(i);
                            pdvs.add(temp.get(i));
                            t.start();
                            Thread.sleep(1000);
                        }
                        //System.out.println("To the bottom"+spdvs);
		}
	}
        ArrayList<String> extension(ArrayList<String> fi)
	{
		HashSet<String> se = new HashSet<String>();
		for(String s:fi)
		{
			int i;
			for(i=0;i<s.length();++i)
			{
				if(s.charAt(i)=='.')break;
			}
			se.add(s.substring(i));
		}
		ArrayList<String> ar = new ArrayList<String>();
		for(String s:se)
		{
			ar.add(s);
		}
		return ar;
	}
        
	public void run(){
            try{
            String destination = "~/MyFiles/";
            String source = "/media/varun/";
            source = source + driveName;
            source = source + "/";
            destination = destination + driveName;
            Scanner sc = new Scanner(System.in);
            destination  = destination + "/";
            System.out.println("Found the Driver "+driveName+". Do you want to:");
            System.out.println("1. Ignore");
            System.out.println("2. Copy the extensions to a single folder.");
            System.out.println("3. Clone the Drive.");
            int i= sc.nextInt();
            if(i==1){
                System.out.println("Ignored!!!");
               return;
            }
            ArrayList<String> temp = new ArrayList();
            String line;
            String command = "sh getextensions.sh "+destination+" "+source;
            Runtime run = Runtime.getRuntime();
            Process pr = run.exec(command);
            pr.waitFor();
            BufferedReader buf = new BufferedReader( new InputStreamReader( pr.getInputStream() ) ) ;
            while ((line=buf.readLine())!=null) {
		temp.add(line); ;
            }
            ArrayList<String> extensions = extension(temp);
            if(i==2){
                  pr = run.exec("clear");
                  for(int ij=0;ij<5;ij++) System.out.println();
                  System.out.println("The Extensions available in your Drive are:");
                  for(int ij=0;ij<extensions.size();i++){
                      System.out.println((i+1)+". "+extensions.get(i));
                  }
                  System.out.print("Enter 0 to copy all the Extensions\nor enter the appropriate id for the extension:");
                  int option = sc.nextInt();
                  if(option == 0){
                      System.out.println("You have chosen to copy all the extensions.\nPlease wait while the process completes.");
                      for(int ik=0;ik<extensions.size();ik++){
                          String dest2 = destination + extensions.get(i);
                          dest2 = dest2 + "/";
                          pr = run.exe("mkdir "+dest2);
                          System.out.println("sh copy_oneDirectory.sh ")
                          
                      }
                  }
                  
            }
            }
            catch(Exception e){
                System.out.println("Exception caught.");
                System.out.println(e);
                       
            }
	}
}

class mainclass
{
	public static void main(String[] args) throws Exception
	{
		Drivers p = new Drivers();
	}

}