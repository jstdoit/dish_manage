# encoding: utf-8

class ClientController < ApplicationController
  def upload
	uploaded_file = params[:apk_file]	
        detail = params[:updated_items]
        update_item = detail.to_s
        version_num = params[:vn]
        version_code = params[:vc]
	File.open(Rails.root.join('/swidy/client', '', uploaded_file.original_filename), 'wb') do |file|
	file.write(uploaded_file.read)
	end
	file = File.open('/swidy/client/update_detail.txt','a+')
	file.puts "主版本号: #{ version_num}"
	file.puts"版本代号：#{version_code}"
	file.puts "更新信息:"
	file.puts detail
	file.puts "--------------"
	file.close

	ver_info = {:vc => version_code, :vn => version_num, :update_items => update_item}
	File.open '/swidy/client/update_details.json','w+' do |file|
		file.write ver_info.to_json
	end
  end

  def index
      respond_to do |format|
      format.html # index.html.erb
    end
	
  end
end
