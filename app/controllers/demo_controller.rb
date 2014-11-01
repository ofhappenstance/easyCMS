class DemoController < ApplicationController

  layout false
  
  def index
    render('hello')
  end

  def hello
    render('index')
  end

  def other_hello
    redirect_to(:controller => 'demo', :action => 'index')
  end

  def google
    redirect_to("http://google.com")
  end

  def text_helpers
  end
end
