class Level < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '多め（しっかり汗をかく）' },
    { id: 3, name: '適度（適度に汗をかく）' },
    { id: 4, name: '軽め（少々汗をかく)' },
    { id: 5, name: 'その他（身体を動かさない)' }
  ]
end
