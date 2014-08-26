class EmailsController < ApplicationController
  def new
    @contact = Contact.find(params[:contact_id])
    contact = Contact.find(params[:contact_id])
    @email = contact.emails.new
    render('emails/new.html.erb')
  end

  def create
    @contact = Contact.find(params[:contact_id])

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
    @contact = Contact.find(@email.contact_id)
    render('emails/edit.html.erb')
  end

  def update
    @email = Email.find(params[:email_id])
    @contact = Contact.find(@email.contact_id)
    if @email.update(:address => params[:address])
      render('emails/success.html.erb')
    else
      render('emails/edit.html.erb')
    end
  end

  def destroy
    @email = Email.find(params[:email_id])
    @contact = Contact.find(@email.contact_id)
    @email.destroy
    render('emails/destroy.html.erb')
  end
end
