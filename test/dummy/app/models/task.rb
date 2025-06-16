class Task < ApplicationRecord
  validates :title, presence: true
  enum status: {
    todo: 0,
    pending: 1,
    in_progress: 2,
    completed: 3,
    on_hold: 4,
    cancelled: 5,
    failed: 6,
    reopened: 7,
  }
end
