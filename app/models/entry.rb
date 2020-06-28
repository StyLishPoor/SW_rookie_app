class Entry < ApplicationRecord
    #前後１週間の予約データを取得するスコープ
    scope :least_entries, ->(basedate) {
        where("reserved_date >= ? and reserved_date <= ?",
            basedate.to_date - 7.days, basedate.to_date + 7.days)
        }
end
