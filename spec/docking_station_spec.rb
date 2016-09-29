require 'docking_station'

describe DockingStation do

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end

  it 'has a variable capacity' do
    station = DockingStation.new(69)
    69.times { station.dock(Bike.new)}
    expect{ station.dock(Bike.new) }.to raise_error 'Docking station full'
  end


  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    subject.dock(Bike.new)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  # it { is_expected.to respond_to(:bikes) }

  it 'docks something' do
    bike = Bike.new
    # we want to return the bike we dock
    expect(subject.dock(bike)).to eq [bike]
  end

  # it 'returns docked bikes' do
  #   bike = Bike.new
  #   subject.dock(bike)
  #   # again, need to return the bike we just docked
  #   expect(subject.bike).to eq [bike]
  # end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
    expect { subject.release_bike }.to raise_error 'No bikes available'

    end
  end
end
