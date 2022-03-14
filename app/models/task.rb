class Task < ApplicationRecord
  enum importance: { middle: 0, high: 1, low: 2 }
end
