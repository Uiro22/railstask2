class Reservation < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :room
  
    validates :start_date,presence: true
    validates :end_date,presence: true
    validates :number,presence: true,numericality: true,inclusion: {in: 1..10}
    validate :date_before_start
    validate :date_before_finish

    def sum_of_price
        room.price  *  number   * (end_date.to_date - start_date.to_date).to_i
      end
    
      def date_before_start
        return if start_date.blank?
        errors.add(:start_date, "は今日以降のものを選択してください") if start_date < Date.today
      end
    
      def date_before_finish
        return if end_date.blank? || start_date.blank?
        errors.add(:end_date, "は開始日以降のものを選択してください") if end_date < start_date
      end
    
    end
