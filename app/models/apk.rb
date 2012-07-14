class Apk < ActiveRecord::Base
  attr_accessible :location, :update_items, :vc, :vn, :apkfile
  attr_accessor :apkfile

  validates_presence_of :update_items, :vc, :vn

  before_create :save_apk_to_file
  private
  def save_apk_to_file
    origname = apkfile.original_filename
    basename = File.basename(origname,".*")
    extname = File.extname(origname)
    endname = basename  + '_' + vn + '_' + vc + extname
    location = '/swidy/client/' + endname
    write_attribute :location, location
    File.open(Rails.root.join('/swidy/client', '', endname), 'wb') do |file|
    file.write(apkfile.read)
    end
		ver_info = {:vc => vc, :vn => vn, :update_items => update_items}
				File.open '/swidy/client/update.json','w+' do |file|
				file.write ver_info.to_json
		end
  end 
end

