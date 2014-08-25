class EmailsController < ApplicationController
  def new
    contact = Contact.find(params[:contact_id])
    @email = contact.emails.new
    render('emails/new.html.erb')
  end

  def create
    @email = Email.new(:address => params[:address],
                       :contact_id => params[:contact_id])

    if @email.save
      render('emails/success.html.erb')
    else
      render('emails/new.html.erb')
    end
  end

  def edit
    @email = Email.find(params[:id])
    render('emails/edit.html.erb')
  end

  def update
    @email = Email.find(params[:email_id])
    if @email.update(:address => params[:address])
      render('emails/success.html.erb')
    else
      render('emails/edit.html.erb')
    end
  end

  def destroy
    email_id = request.original_url.split('/')[6].to_i
    @email = Email.where(id: email_id)
    @email.first.destroy
    render('emails/destroy.html.erb')
  end
end
