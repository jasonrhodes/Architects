require_relative "../../lib/architects/place"

module Architects
  describe Place do
    let(:player) { stub }

    it "begins as unowned" do
      subject.owner.should == Place::Unowned
    end

    it "can be built upon" do
      subject.claim player
      subject.owner.should == player
    end

    it "prevents claiming if owned" do
      another_player = stub
      subject.claim player
      lambda {
        subject.claim another_player
      }.should raise_error Place::OwnershipError
      subject.owner.should == player
    end

    it "prevents claiming if closed" do
      subject.close
      lambda {
        subject.claim player
      }.should raise_error Place::UnbuildableError
      subject.owner.should == Place::Unowned
    end
  end
end

