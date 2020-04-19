import std.stdio,std.math,std.string,std.conv,std.typecons,std.format;
import std.algorithm,std.range,std.array,std.numeric;
 
T[] readarr(T=long)(){return readln.chomp.split.to!(T[]);}
void scan(T...)(ref T args){auto input=readln.chomp.split;foreach(i,t;T)args[i]=input[i].to!t;}
struct Queue(T){T[]e;auto enq(T t){e~=t;}auto enq(T[]ts){e~=ts;}T deq(){T tp=e[0];e=e.length>1?e[1..$]:[];return tp;}}
struct Stack(T){T[]e;auto push(T t){e~=t;}auto push(T[]ts){e~=ts;}T pop(){T tp=e[$-1];e=e.length>1?e[0..$-1]:[];return tp;}}
 
//END OF TEMPLATE

void main(){
}
