class EarningsAndExpenses {
  final int id;
  final String content;
  final double value;
  final bool paid;

  const EarningsAndExpenses({
    required this.id,
    required this.content,
    required this.value,
    required this.paid
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'value': value,
      'paid': paid,
    };
  }

  @override
  String toString() {
    return 'EarningsAndExpenses{id: $id, content: $content, value: $value, paid: $paid}';
  }
}
