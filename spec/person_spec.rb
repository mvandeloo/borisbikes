require 'person'

describe Person do 
	let(:person) { Person.new }

	it 'has no bike' do
		expect(person).not_to have_bike	
	end	

	it 'can rent a bike' do
		station = double :station
		expect(station).to receive(:rent_bike)

		person.rent_bike_from station
	end
		
	it 'has bike when renting' do
		station = double :station, rent_bike: :bike
		person.rent_bike_from station

		expect(person).to have_bike

	end


	it 'can return a bike' do
		person = Person.new :bike
		station = double :station 
		expect(station).to receive(:dock).with(:bike)

		person.return_bike_to station
	end
		
	it 'can break bike' do	
		bike = double :bike
		expect(bike).to receive(:break!)

		# person = Person.new :bike

		# expect(person).to break_bike



