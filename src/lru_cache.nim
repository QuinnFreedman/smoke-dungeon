import tables

type
    Node[K, V] = object
        key: K
        value: V
        prev: NodePtr[K, V]
        next: NodePtr[K, V]
    NodePtr[K, V] = ref Node[K, V]

type LRUCache*[K, V] = object
    capacity: int
    table: Table[K, NodePtr[K, V]]
    head, tail: NodePtr[K, V]
    nilValue: V
    freeProc: proc(key: K, value: V)


func newNode[K, V](value: V, prev, next: NodePtr[K, V]): NodePtr[K, V] =
    # result = cast[NodePtr[K, V]](alloc(sizeof(Node[K, V])))
    new result
    result.value = value
    result.prev = prev
    result.next = next


func newLRUCache*[K, V](capacity: int, nilValue: V,
                        freeProc: proc(key: K, value: V)): LRUCache[K, V] =
    result.capacity = capacity
    result.table = initTable[K, NodePtr[K, V]]()
    result.nilValue = nilValue
    result.freefunc = freeProc
    for _ in 0..<capacity:
        if result.head.isNil:
            result.head = newNode[K, V](nilValue, nil, nil)
            result.tail = result.head
        else:
            let oldTail = result.tail
            result.tail = newNode(nilValue, oldTail, nil)
            oldTail.next = result.tail.next


func removeFromChain[K, V](self: var LRUCache[K, V], node: NodePtr[K, V]) =
    if node == self.head:
        self.head = node.next
    else:
        node.prev.next = node.next

    if node == self.tail:
        self.tail = node.prev
    else:
        node.next.prev = node.prev


func insertHead[K, V](self: var LRUCache[K, V], newHead: NodePtr[K, V]) =
    let oldHead = self.head
    oldHead.prev = newHead

    newHead.prev = nil
    newHead.next = oldHead
    self.head = newHead



func put*[K, V](self: var LRUCache[K, V], key: K, value: V) =
    if key in self.table:
        let node = self.table[key]
        self.removeFromChain(node)
        self.insertHead(node)
        node.value = value
    else:
        # delete the tail
        let recycledNode = self.tail
        self.removeFromChain(recycledNode)

        # delete the old table entry
        self.table.del(recycledNode.key)
        if recycledNode.value != self.nilValue and not self.freeProc.isNil:
            self.freeProc(recycledNode.key, recycledNode.value)

        # set the recycled node as the new head
        self.insertHead(recycledNode)

        # set data for new node
        recycledNode.key = key
        recycledNode.value = value
        self.table[key] = recycledNode


func get*[K, V](self: var LRUCache[K, V], key: K): V =
    if not (key in self.table):
        return self.nilValue

    let node = self.table[key]
    if node != self.head:
        self.removeFromChain(node)
        self.insertHead(node)

    return node.value


if isMainModule:
    var cache = newLRUCache[string, int](4, -1,
            proc(a: string, b: int) = echo "freed " & (
                if a.isNil: "nil" else: $a) & ":" & $b)
    cache.put("A", 1)
    cache.put("B", 2)
    cache.put("C", 3)
    cache.put("D", 4)
    cache.put("E", 5)
    assert cache.get("A") == -1
    assert cache.get("B") == 2
    assert cache.head.key == "B"
    cache.put("D", 6)
    assert cache.get("D") == 6
