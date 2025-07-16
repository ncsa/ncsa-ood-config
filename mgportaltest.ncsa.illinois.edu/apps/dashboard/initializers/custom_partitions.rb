require 'ood_support'

class CustomPartitions
  def self.partitions
    @partitions ||= begin
      # start with partitions that everyone can use
      @partitions_avail_cpu = ["magnus", "debug", "himem"]
      @partitions_avail_gpu = ["gpu"]
      groups = OodSupport::Process.groups.map(&:name)
      # add restricted partitions
#      if groups.include?('grc')
      !(groups & ["mg_abv_grc", "mg_ncsa_user"]).empty?
      @partitions_avail_cpu.append('grc')
#      end
#      if groups.include?('mg_abv_grc_be')
      !(groups & ["mg_abv_grc_be", "mg_ncsa_user"]).empty?
      @partitions_avail_cpu.append('be_gpu')
#      end
#      if groups.include?('mg_abv_caim_gpu')
      !(groups & ["mg_abv_caim_gpu", "mg_ncsa_user"]).empty?
      @partitions_avail_cpu.append('caim_gpu')
#      end
#      if groups.include?('mg_abv_wide_gpu')
      !(groups & ["mg_abv_wide_gpu", "mg_ncsa_user"]).empty?
      @partitions_avail_cpu.append('wide_gpu')
#      end

      @partitions_avail = @partitions_avail_cpu + @partitions_avail_gpu
    end
  end
end

Rails.application.config.after_initialize do
  CustomPartitions.partitions
end
