author_1 = Author.create(first_name: 'George', last_name: 'Washington')
author_2 = Author.create(first_name: 'Thomas', last_name: 'Jefferson')

work_1 = Work.create(
    title: 'Das Kapital',
    authors: [author_1],
    publication_date: Date.new(1787),
    language: 'Esperanto',
    type_of_work: 'Book',
    keywords: 'alienation opiate communism',
    link: 'https://en.wikipedia.org/wiki/Capital:_Critique_of_Political_Economy',
    bibliographic_entry: 'Van Parijs, Philippe. 1995. Real Freedom for All. What (if anything) Can Justify Capitalism?, Oxford, Clarendon Press ("Oxford Political Theory"), 1995, xii + 336p.'
  )

work_2 = Work.create(
    title: 'The Meaning of "Meaning"',
    authors: [author_1, author_2],
    publication_date: Date.new(2020),
    language: 'Esperanto',
    type_of_work: 'Article',
    journal: 'Today\'s top 10 hits',
    keywords: 'meaning "meaning"',
    link: 'https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=hilary%20putnam%20the%20meaning%20of%20meaning',
  )