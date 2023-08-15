// ignore_for_file: unnecessary_new, unused_element

class ListNode {
  late ListNode? next;
  late String teacher;

  ListNode(String Teacher) {
    this.teacher = teacher;
    this.next = null;
  }
}

class techersQueue {
  ListNode? _front;
  late String teacher;
  late ListNode? next;
  ListNode? current;

  void clear() {
    ListNode? _front;
    _front = null;
  }

  void addQueue(String Teacher) {
    ListNode? _front;

    this.teacher = teacher;
    this.next = null;

    if (_front == null) {
      _front = new ListNode(teacher);
    } else {
      ListNode current = _front;
      while (current.next != null) {
        current = current.next!;
      }
      current.next = new ListNode(teacher);
    }
  }

  void isEmpty() {
    bool checkEmpty;
    ListNode? _front;

    bool isEmpty() {
      return _front == null;
    }
  }

  String? rear() {
    ListNode? _front;
    this.next = null;
    this.teacher = teacher;
    ListNode current;

    if (_front == null) {
      return null;
    }
    // ListNode current = _front;
    while (current.next != null) {
      current = current.next!;
    }
    return current.teacher;
  }

  String? front() {
    ListNode? _front;
    this.teacher = teacher;

    if (_front == null) {
      return null;
    }
    return _front!.teacher;
  }
}
