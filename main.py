import java.lang.* ;
import java.io.*;

class mainclass
{
public static void main(String[] args) throws Exception
{
String cmd = "ls" ;
Runtime run = Runtime.getRuntime() ;
Process pr = run.exec(cmd) ;
pr.waitFor() ;
BufferedReader buf = new BufferedReader( new InputStreamReader( pr.getInputStream() ) ) ;

String line ;
while ( (  line = buf.readLine() ) != null ) 
{
System.out.println(line) ;
}

}

}