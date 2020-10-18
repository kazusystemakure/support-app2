class Publish < ActiveHash::Base
  self.data = [
    { id: 1, name: '公開しない' },
    { id: 2, name: '公開する' }
  ]
end
