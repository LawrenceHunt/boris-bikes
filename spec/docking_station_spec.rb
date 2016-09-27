
require 'docking_station'

describe DockingStation do
    it { is_expected.to respond_to :release_bike}

    it 'releases working bikes' do
				bike = Bike.new
				subject.dock(bike)
        expect(bike).to be_working
    end



    it {is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to(:bikes)}




    describe "#release_bike" do
        it 'releases a bike' do
						bike = Bike.new
						subject.dock(bike)
            expect(subject.release_bike).to eq bike
        end
    end



    describe '#dock' do
        it 'raises an error when full' do
			DockingStation::DEFAULT_CAPACITY.times do
	  	subject.dock Bike.new
			end
            expect { subject.dock Bike.new }.to raise_error 'Docking station full'
        end
    end


describe 'initialization' do
	subject { DockingStation.new }
	let(:bike) {Bike.new}
	it 'defaults capacity' do
		described_class::DEFAULT_CAPACITY.times do
			subject.dock(bike)
		end
		expect { subject.dock(bike)}.to raise_error 'Docking station full'
		end


	it 'has a variable capacity' do
		docking_station = DockingStation.new(50)
		50.times { docking_station.dock Bike.new }
		expect{ docking_station.dock Bike.new}.to raise_error 'Docking station full'
	end
	end


end
