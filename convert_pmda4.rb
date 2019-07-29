require 'csv'
i=0
oshirase=Hash.new
CSV.foreach("PMDA3.csv") do |row|
	if i>0 then
		oshirase[i]=[row[0],row[1]]
	end
	i+=1
end
 #p oshirase
 #p "oshirase nonakamidayo"
CSV.open("pmda_conv.csv","w") do |csv|
	oshirase.each{|i,d1|
		csv << [i,d1[0],d1[1]]
	}
end

searchwd=Array.new
CSV.foreach("20190518.csv") do |row|
	if row[1] then
		searchwd <<row[1]
	end
end
#p searchwd

searchrs=Array.new
searchwd.uniq.each{|wd|
	oshirase.each{|i,data|
		#data=["お知らせ", "輸液ポンプ"]
		if data[1] =~ /#{wd}/ then
			searchrs << [i,data[0],data[1],wd]
		end
	}
}
p searchrs

#searchrs.each{|da|
#	if da[3]=nil
#		delete[da[0],da[1],da[2],da[3]]
#    end
#}


CSV.open("search_rs3.csv","w") do |csv|
	searchrs.each{|r|
		   csv << r
	}


end
