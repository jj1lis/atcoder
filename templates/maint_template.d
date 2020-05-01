import std;

enum inf(T)()if(__traits(isArithmetic,T)){
    return T.max/4;
}

T scan(T=long)(){
    return readln.chomp.to!T;
}

void scan(T...)(ref T args){
    auto input=readln.chomp.split;
    foreach(i,t;T)
        args[i]=input[i].to!t;
}

T[] scanarr(T=long)(){
    return readln.chomp.split.to!(T[]);
}

alias Queue=DList;
auto enq(T)(ref Queue!T q,T e){
    q.insertBack(e);
}
T deq(T)(ref Queue!T q){
    auto e=q.front;
    q.removeFront;
    return e;
}

alias Stack=SList;
auto push(T)(ref Stack!T s,T e){
    s.insert(e);
}
T pop(T)(ref Stack!T s){
    auto e=s.front;
    s.removeFront;
    return e;
}


struct UnionFind(T){
    T[T] u;
    ulong[T] rank;
    @property{

        bool inc(T e){
            return e in u;
        }

        auto size(){
            return u.keys.length;
        }

        auto dup(){
            T[] child=u.keys;
            T[] parent=u.values;
            auto res=UnionFind!T(child);
            child.each!(e=>res.add(e));
            size.iota.each!(i=>res.unite(child[i],parent[i]));
            return res;
        }
    }

    this(T e){
        e.add;
    }

    this(T[] es){
        es.each!(e=>e.add);
    }

    auto add(T a,T b=a){
        assert(b.inc);
        u[a]=a;rank[a];
        if(a!=b)
            unite(a,b);
    }

    auto find(T e){
        if(u[e]==e)
            return e;
        return u[e]=find(u[e]);
    }

    auto same(T a,T b){
        return a.find==b.find;
    }
    auto unite(T a,T b){
        a=a.find;
        b=b.find;
        if(a==b)
            return;
        if(rank[a]<rank[b])
            u[a]=b;
        else{
            u[b]=a;
            if(rank[a]==rank[b])
                rank[a]++;
        }
    }
}

struct PriorityQueue(T,alias less="a<b"){
    BinaryHeap!(T[],less) heap;
    @property{
        bool empty(){return heap.empty;}
        auto length(){return heap.length;}
        auto dup(){return PriorityQueue!(T,less)(array);}
        T[] array(){
            T[] res;auto tp=heap.dup;
            foreach(i;0..length){
                res~=tp.front;
                tp.removeFront;
            }
            return res;}
        void push(T e){heap.insert(e);}
        void push(T[] es){es.each!(e=>heap.insert(e));}
    }   
    T look(){return heap.front;}
    T pop(){T tp=look;heap.removeFront;return tp;}
    this(T e){ 
        heap=heapify!(less,T[])([e]);
    }   
    this(T[] e){ 
        heap=heapify!(less,T[])(e);
    }   
}

auto cumulativeSum(T)(T[] arr){
    T[] tmp;
    (arr.length).iota.each!(i=>tmp~=i==0?arr[0]:tmp[i-1]+arr[i]);
    return tmp;
}

//TODO
//auto cumulativeXOR(T)()

//END OF TEMPLATE

void main(){
    [1,2,3,4,5,6,7,8,9,10].cumulativeSum.writeln;
}
