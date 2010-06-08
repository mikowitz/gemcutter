class HomeController < ApplicationController
  def index
    @count = Rubygem.total_count
    @latest = Rubygem.latest
    @downloaded = Rubygem.downloaded
    @updated = Version.updated
  end

  def new_gems
    @new_gems = Rubygem.latest.paginate(:limit => Rubygem.total_count, :page => params[:page])
  end

  def most_downloaded
    @most_downloaded = Rubygem.paginate(:all, :order => "downloads DESC, lower(name)", :page => params[:page])
  end

  def just_updated
    @just_updated = Version.updated.paginate(:page => params[:page])
  end
end
