module Garbanzo
  class Connection
    attr_accessor :login, :password, :test_mode

    def initialize(login = nil, password = nil, test_mode = false)
      @login = login
      @password = password
      @test_mode = test_mode
    end
  end
end
