require_relative "../../lib/architects/board"

module Architects
  describe Board do
    context "#build" do
      let(:player) { stub }

      it "builds on buildable positions" do
        subject.build player, 3, 4
        subject.owner_at(3, 4).should == player
      end

      it "closes position to the left for building" do
        subject.build player, 3, 4
        lambda {
          subject.build player, 2, 4
        }.should raise_error Place::UnbuildableError
      end

      it "closes position to the right for building" do
        subject.build player, 3, 4
        lambda {
          subject.build player, 4, 4
        }.should raise_error Place::UnbuildableError
      end

      it "closes position below for odd column, even row" do
        subject.build player, 3, 4
        lambda {
          subject.build player, 2, 5
        }.should raise_error Place::UnbuildableError
      end

      it "closes position above for even column, even row" do
        subject.build player, 4, 4
        lambda {
          subject.build player, 3, 3
        }.should raise_error Place::UnbuildableError
      end

      it "closes position below for odd column, odd row" do
        subject.build player, 3, 3
        lambda {
          subject.build player, 4, 4
        }.should raise_error Place::UnbuildableError
      end

      it "closes position above for even column, odd row" do
        subject.build player, 4, 3
        lambda {
          subject.build player, 5, 2
        }.should raise_error Place::UnbuildableError
      end
    end
  end
end

