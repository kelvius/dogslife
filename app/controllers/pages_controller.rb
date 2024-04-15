# frozen_string_literal: true

class PagesController < ApplicationController
  def about
    @page_content = PageContent.find_by(page_type: 'about')
  end

  def contact
    @page_content = PageContent.find_by(page_type: 'contact')
  end
end
