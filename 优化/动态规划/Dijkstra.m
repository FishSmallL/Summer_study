% 定义图的邻接矩阵
% Inf 表示节点之间没有直接路径
graph = [0 5 5 Inf Inf Inf Inf;
         Inf 0 Inf 2 2 Inf Inf;
         Inf 2 0 4 4 Inf Inf;
         Inf Inf Inf 0 1 1 Inf;
         Inf Inf Inf Inf 0 Inf 3;
         Inf Inf Inf Inf Inf 0 4;
         Inf Inf Inf Inf Inf Inf 0];

% 节点数量
numNodes = size(graph, 1);

% 从源节点到每个节点的距离
dist = inf(1, numNodes);
dist(1) = 0; % 从A到A的距离为0

% 最优路径中前一个节点
prev = NaN(1, numNodes);

% 未访问节点集合
unvisited = true(1, numNodes);

while any(unvisited)
    % 找到距离最小的未访问节点
    [~, currentNode] = min(dist .* unvisited);
    
    % 如果最小距离为无穷大，结束算法
    if isinf(dist(currentNode))
        break;
    end
    
    % 对当前节点，更新其邻居节点的距离
    for neighbor = 1:numNodes
        if graph(currentNode, neighbor) ~= Inf && unvisited(neighbor)
            newDist = dist(currentNode) + graph(currentNode, neighbor);
            if newDist < dist(neighbor)
                dist(neighbor) = newDist;
                prev(neighbor) = currentNode;
            end
        end
    end
    
    % 将当前节点标记为已访问
    unvisited(currentNode) = false;
end

% 重建从A到G的最短路径
path = [];
node = numNodes; % 从目标节点G开始
while ~isnan(node)
    path = [node path];
    node = prev(node);
end

% 显示结果
print('结束')
disp('从A到G的最短路径:');
disp(path);
disp('对应的距离:');
disp(dist(numNodes));
