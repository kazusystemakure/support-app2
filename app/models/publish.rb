class Publish < ActiveHash::Base
  self.data = [
    { id: 1, name: '希望しない（公開しない）' },
    { id: 2, name: '講師 希望（公開する）' },
  ]
end
