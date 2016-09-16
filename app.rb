require 'sinatra'
require 'active_record'
require './config/environment'
require './models/event'
require './models/person'
require './models/registration'
require 'byebug'

get '/' do
  erb :index
end

get '/people' do 
  @people = Person.all
  erb :people
end

get '/events' do
  @events = Event.all
  erb :events
end

get '/event/:event_id' do
  event_id = params[:event_id].to_i
  registras = Registration.where(events_id: event_id)
  @event = Event.find(event_id)
  @registra_list = []
  registras.each do |registra|
    name = Person.find(registra.people_id).name
    @registra_list.push({:name => name, :status => registra.status});
  end
  erb :event_detail
end

get '/registrations' do
  @registrations = Registration.all
  @regis_info = []
  @registrations.each do |registra|
    person = Person.find(registra.people_id)
    event = Event.find(registra.people_id)
    @regis_info.push({:person => person.name, :event => event.name, :status => registra.status})
  end
  erb :registrations
end

post '/people' do
  data = params[:person]
  if (data[:gender] != "male" && data[:gender] != "female")
    "Gender wrong."
  else
    data[:gender] = data[:gender] == "male" ? 1 : 0
    person = Person.new(data)
    begin
      if person.save!
        redirect '/people'
      else
        "Sorry, there was an error!"
      end
    rescue
      "Sorry, there was an error!"
    end
  end
end

post '/events' do
  event = Event.new(params[:event])
  if event.save
    redirect '/events'
  else
    "Sorry, there was an error!"
  end
end

post '/registrations' do
  data = params[:registra]
  if ActiveRecord::RecordNotFound == people = Person.where(name: data[:person]).take!
    return "No such person."
  end
  event_id = data[:event_id].to_i
  status = data[:status]
  byebug
  registra = Registration.new(:people_id => people.id, :events_id => event_id, :status => status)
  begin
    if registra.save
      redirect '/events'
    else
      "Sorry, there was an error!"
    end
  rescue
    "Sorry, there was an error!"
  end
end