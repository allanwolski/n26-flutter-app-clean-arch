// ignore: prefer_single_quotes, leading_newlines_in_multiline_strings
const transactionMock = """[
    {
        "id": "90c4bb36-a768-4013-a1f8-8b425b05e263",
        "date": "2021-08-29",
        "description": "YOOX",
        "amount": -145.9
    }
]""";

const expectedMap = [
  {
    'id': '90c4bb36-a768-4013-a1f8-8b425b05e263',
    'date': '2021-08-29',
    'description': 'YOOX',
    'amount': -145.9,
  }
];
