class ImagesForReportController < ApplicationController
	def index
		authorize :image_for_report, :index?
	  	@images = ImageReport.all
	  	@report = params[:devic]
	  	@report_int = @report.to_i
	  	@report_int
  	end
end
