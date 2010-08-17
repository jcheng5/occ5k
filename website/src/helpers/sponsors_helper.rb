require 'pp'
module SponsorsHelper
  
  def begin_sponsors
    @sizes = Hash.new
    @used = []
    sizes = IO.read(File.join(RootDir, 'website/site/images/logos/sizes.txt'))
    lines = sizes.split(/\r?\n/).each do |line|
      name, width, height = line.chomp.split("\t")
      @sizes[name] = [width, height]
    end
    nil
  end
  
  def sponsor(name, url, logo)
    @used << logo
    url = 'http://' + url unless url =~ /^http:\/\//
    width, height = @sizes[logo]
    partial('sponsor', :locals => { :name => name, 
                                    :url => url, 
                                    :logo => logo, 
                                    :width => width, 
                                    :height => height })
  end
  
  def end_sponsors
    keys = @sizes.keys
    @used.each {|f| keys.delete(f)}
    
    if !keys.empty?
      return "<p><strong>Warning:</strong> Unused logos: " + keys.join(', ') + "</p>"
    end
  end
  
end