class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :open_id
      t.string :avartar_url, default: "https://airgandc.oss-cn-shanghai.aliyuncs.com/WechatIMG170%E7%9A%84%E5%89%AF%E6%9C%AC.png"
      t.string :nickname, default: "user"
      t.string :addressrails

      t.timestamps
    end
  end
end
