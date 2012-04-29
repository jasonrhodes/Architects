Given /^the board is setup$/ do
  @board = Architects::Board.new
end

When /^each player chooses starting settlements$/ do
  @board.build 'Brian', 4, 5
  @board.build 'Andrew', 5, 2
  @board.build 'Pete', 6, 3
  @board.build 'Mike', 9, 2

  @board.build 'Mike', 10, 3
  @board.build 'Pete', 8, 4
  @board.build 'Andrew', 8, 5
  @board.build 'Brian', 8, 6
end

Then /^each player should have 2 points$/ do
  pending # express the regexp above with the code you wish you had
end

