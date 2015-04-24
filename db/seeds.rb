responders = [
  { type: 'Fire', name: 'F-100', capacity: 1 },
  { type: 'Police', name: 'P-100', capacity: 2 },
  { type: 'Medical', name: 'M-100', capacity: 3 }
]

responders.each do |responder|
  Responder.create(responder)
end