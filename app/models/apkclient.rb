class Apkclient < ActiveRecord::Base
  attr_accessible :update_items, :version_code, :version_number, :apkfile
  attr_accessor :apkfile
  validates_presence_of :update_items, :version_code, :version_number
  validates_uniqueness_of :version_number
  before_create :save_apkclient_to_file


  private
  def save_apkclient_to_file
    origname = apkfile.original_filename
    basename = File.basename(origname,".*")
    extname = File.extname(origname)
    endname = basename  + '_' + version_code + '_' + version_number + extname
    
    
    File.open(Rails.root.join('/swidy/client', '', endname), 'wb') do |file|
    file.write(apkfile.read)
    end
                ver_info = {:version_code => version_code, :version_number => version_number, :update_items => update_items}
                                File.open '/swidy/client/update.json2','w+' do |file|
                                file.write ver_info.to_json
                end
  end
  
end
