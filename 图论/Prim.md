# Prim算法

&emsp;&emsp;设置两个集合$P$和$Q$ ,其中$P$用于存放$G$的最小生成树中的顶点，集合$Q$存放$G$的最小生成树中的边。令集合$P$的初值为$P ={v_1}$（假设构造最小生成树时，从顶点$v_1$出发），集合$Q$的初值为$Q = \Psi$。$prim$ 算法的思想是，从所有$p \in P ，v \in V - P$的边中，选取具有最小权值的边$pv$，将顶点$v$加入集合$P$中，将边$pv$加入集合$Q$中，如此不断重复，直到$P =V时$，最小生成树构造完毕，这时集合$Q$中包含了最小生成树的所有边。
<img src="/img/prim.jpg" height=350>

~~~matlab
a=zeros(7);
a(1,2)=50; a(1,3)=60;
a(2,4)=65; a(2,5)=40;
a(3,4)=52; a(3,7)=45;
a(4,5)=50; a(4,6)=30;a(4,7)=42;
a(5,6)=70;
a=a+a';a(find(a==0))=inf;
result=[];
p=1;
tb=2:length(a);
while length(result)~=length(a)-1
 temp=a(p,tb);
 temp=temp(:);    % 将temp 转换为一维列向量，以便可以对它应用 min 函数
 d=min(temp);
 [jb,kb]=find(a(p,tb)==d);
 j=p(jb(1));
 k=tb(kb(1));
 result=[result,[j;k;d]];    % 追加到现有的 result 数组的末尾。
 p=[p,k];
 tb(find(tb==k))=[];    % 去除已经找到的点
end
result
~~~

