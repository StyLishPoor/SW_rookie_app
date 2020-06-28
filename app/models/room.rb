class Room < ApplicationRecord
    # コールバック]
    before_validation :remove_space_and_put_

    # 標準Validation
    validates :name, :place, :number, presence:true
    validates :name, length: {maximum: 30}
    validates :place, inclusion: {in:['東京','大阪','福岡','札幌','仙台','名古屋','金沢']}
    validates :number, numericality: {greater_than_or_equal_to:5,less_than_or_equal_to:30}
    # 自作Validation
    validate :name_check
    validate :five_mul_check

    private
    def name_check
        name_pattern = /\A.+#\d{2}\z/
        unless name_pattern.match(self.name)
            errors.add(:name, "会議室名が正しくありません")            
        end
    end

    def five_mul_check
        if (self.number.to_i % 5) != 0
            errors.add(:number, "収容人数は５の倍数で指定してください")
        end
    end

    def remove_space_and_put_
        self.name = self.name.strip.gsub(/\s/, "_")
    end
end
