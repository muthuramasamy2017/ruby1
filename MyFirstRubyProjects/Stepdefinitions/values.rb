require 'selenium-webdriver'
driver = Selenium::Webdriver.for :chrome

Given(/^I am on the excercisel values page$/) do
  driver.navigate.to "https://exercisel.com/values"
end

When(/^I check the values$/) do
end

Then(/^I should see the right number of values appear on the screen$/) do
  @wait.until {@driver.find_element(:id => 'txt_val_1')[value].should eql '$122365.24'}
  @wait.until {@driver.find_element(:id => 'txt_val_2')[value].should eql '$599.00'}
  @wait.until {@driver.find_element(:id => 'txt_val_3')[value].should eql '$850139.99'}
  @wait.until {@driver.find_element(:id => 'txt_val_4')[value].should eql '$23329.50'}
  @wait.until {@driver.find_element(:id => 'txt_val_5')[value].should eql '$566.27'}
end

Then(/^The values should be greater than zero$/) do
  @wait.until {@driver.find_element(:id => 'txt_val_1')[value].should > 0}
  @wait.until {@driver.find_element(:id => 'txt_val_2')[value].should > 0}
  @wait.until {@driver.find_element(:id => 'txt_val_3')[value].should > 0}
  @wait.until {@driver.find_element(:id => 'txt_val_4')[value].should > 0}
  @wait.until {@driver.find_element(:id => 'txt_val_5')[value].should > 0}
end

And(/^The values should be formatted in currency$/) do
  r = /^\d+\.\d\d$/
  amount = @wait.until {@driver.find_element(:id => 'txt_val_1')[value].gets.chomp}
  unless amount.match r
    puts 'incorrect format'
  end

  amount = @wait.until {@driver.find_element(:id => 'txt_val_2')[value].gets.chomp}
  unless amount.match r
    puts 'incorrect format'
  end

  amount = @wait.until {@driver.find_element(:id => 'txt_val_3')[value].gets.chomp}
    unless amount.match r
      puts 'incorrect format'
    end

  amount = @wait.until {@driver.find_element(:id => 'txt_val_4')[value].gets.chomp}
      unless amount.match r
        puts 'incorrect format'
      end

  amount = @wait.until {@driver.find_element(:id => 'txt_val_5')[value].gets.chomp}
        unless amount.match r
          puts 'incorrect format'
        end
end

Then(/^The Total Balance is equal to the sum of the values$/) do
  value1 = @wait.until {@driver.find_element(:id => 'txt_val_1')[value]}
  value2 = @wait.until {@driver.find_element(:id => 'txt_val_2')[value]}
  value3 = @wait.until {@driver.find_element(:id => 'txt_val_3')[value]}
  value4 = @wait.until {@driver.find_element(:id => 'txt_val_4')[value]}
  value5 = @wait.until {@driver.find_element(:id => 'txt_val_5')[value]}
  total_balance = value1+value2+value3+value4+value5
  puts(total_balance)
  unless total_balance.match 1000000.00
    puts 'incorrect value'
  end
end


