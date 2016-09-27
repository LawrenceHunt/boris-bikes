
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
          20.times {subject.dock(Bike.new)}
            expect { subject.dock Bike.new }.to raise_error 'Docking station full'
        end
    end

end
