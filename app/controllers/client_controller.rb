class ClientController < ApplicationController
  def upload
	uploaded_file = params[:apk_file]
	versioncode = params[:vs]
	versionnumber = params[:vn]
	updateditems = params[:ui]

	File.open(Rails.root.join('/swidy/client', '', uploaded_file.original_filename), 'wb') do |file|
		file.write(uploaded_file.read)
	end
	File.open '/swidy/client/yuanpeng.txt', 'w' do |file|
		file.puts "version code:" + versioncode

		file.puts "version number:" + versionnumber

		file.puts "update_items:" + updateditems
	end
  end

  def index
	respond_to do |format|
		format.html # index.html.erb
	end
	
  end
end
