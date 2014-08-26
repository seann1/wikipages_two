class PhonesController < ApplicationController
  def new
    @contact = Contact.find(params[:contact_id])
    contact = Contact.find(params[:contact_id])
    @phone = contact.phones.new
    render('phones/new.html.erb')
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @phone = Phone.new(:number => params[:number],
                       :contact_id => params[:contact_id])

    if @phone.save
      render('phones/success.html.erb')
    else
      render('phones/new.html.erb')
    end
  end

  def edit
    @phone = Phone.find(params[:id])
    @contact = Contact.find(@phone.contact_id)
    phone_id = request.original_url.split('/')[6].to_i
    render('phones/edit.html.erb')
  end

  def update
    @contact = Contact.find(params[:id])
    @phone = Phone.find(params[:phone_id])
    if @phone.update(:number => params[:phone])
      render('phones/success.html.erb')
    else
      render('phones/edit.html.erb')
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    phone_id = request.original_url.split('/')[6].to_i
    @phone = Phone.where(id: phone_id)
    @phone.first.destroy
    render('phones/destroy.html.erb')
  end
end
