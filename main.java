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
			se.add(s.substring(i+1));
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
            String destination = "/home/varun/MyFiles/";
            String source = "/media/varun/";
            source = source + driveName;
            destination = destination + driveName;
            Scanner sc = new Scanner(System.in);
            System.out.println("Found the Driver "+driveName+". Do you want to:");
            System.out.println("1. Ignore");
            System.out.println("2. Copy the extensions to a single folder.");
            System.out.println("3. Clone the Drive.");
            int i;
            while(true){
            i= sc.nextInt();
            if(i==1){
                System.out.println("Ignored!!!");
               return;
            }
            if(i<=0||i>3) {System.out.println("Wrong choice!!!Enter again");continue;}
            break;
            }
            ArrayList<String> temp = new ArrayList();
            String line;
            String command = "sh /home/varun/codes/fileO/exten.sh "+source.substring(0,source.length()-1);
            Runtime run = Runtime.getRuntime();
            Process pr = run.exec(command);
            pr.waitFor();
            BufferedReader buf = new BufferedReader( new InputStreamReader( pr.getInputStream() ) ) ;
            while ((line=buf.readLine())!=null) {
                int flag=0;
                int deci=0;
                for(int ip=0;ip<line.length();ip++){
                    if(line.charAt(ip)=='.'){deci++;continue;}
                    else if((line.charAt(ip)>='A'&&line.charAt(ip)<='Z')||(line.charAt(ip)>='a'&&line.charAt(ip)<='z')||(line.charAt(ip)>='0'&&line.charAt(ip)<='9'))
                        continue;
                    flag=1;
		          System.out.println(line.charAt(ip));
                }
                if(flag==0&&deci==1){
                temp.add(line);
            }
            ArrayList<String> extensions = extension(temp);
            Runtime run1 = Runtime.getRuntime();
            for(int ij=0;ij<5;ij++) System.out.println();
            System.out.println("The Extensions available in your Drive are:");
            for(int ij=0;ij<extensions.size();ij++){
               System.out.println((ij+1)+". "+extensions.get(ij));
            }
            
            System.out.print("Enter 0 to copy all the Extensions\nor enter the appropriate id for the extension:");
            int option;
            while(true){
            option = sc.nextInt();
               if(option<0 || option >extensions.size()){System.out.println("Wrong choice!!!Enter again!!!");continue;}
               break;
            }
            if(option == 0){
                System.out.println("You have chosen to copy all the extensions.\nPlease wait while the process completes.");
                for(int ik=0;ik<extensions.size();ik++){
                    String dest2 = destination;
              
             //       Runtime run2 = Runtime.getRuntime();
                    String str22 = "mkdir "+dest2;
            //        Process pr2 = run2.exec(str22);
            //        pr2.waitFor();
                    if(i==2){
             
                    Runtime run3 = Runtime.getRuntime();
                    String ssg = "sh copy_onedir.sh "+source+" "+dest2+" "+extensions.get(ik);
                    Process pr3 = run3.exec(ssg);
                    pr3.waitFor();
                    System.out.println("File transfer completed!!!");
                    }
                    else{
                    Runtime run4 = Runtime.getRuntime();
                    String sgp = "sh copy_clone.sh "+source+" "+dest2+" "+extensions.get(ik);
                    Process pr4 = run4.exec(sgp);
                    pr4.waitFor();
                    System.out.println("File transfer completed!!!");
                    }
                      
                }
              
            }
            else if(option <= extensions.size()&&option >0){
                    String dest2 = destination;
              
                    String str22 = "mkdir "+dest2;
                    if(i==2){
                    Runtime run3 = Runtime.getRuntime();
                    String ssg = "sh copy_onedir.sh "+source+" "+dest2+" "+extensions.get(option-1);
                    Process pr3 = run3.exec(ssg);
                    pr3.waitFor();
                    System.out.println("File transfer completed!!!");
                    }
                    else{
                    Runtime run4 = Runtime.getRuntime();
                    String sgp = "sh copy_clone.sh "+source+" "+dest2+" "+extensions.get(option-1);
                    Process pr4 = run4.exec(sgp);
                    pr4.waitFor();
                    System.out.println("File transfer completed!!!");
                    }                  
            }}
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