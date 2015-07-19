module Garbanzo
  class Credentials
    attr_reader :login, :password, :test_mode

    def initialize(login, password, test_mode = true)
      @login = login
      @password = password
      @test_mode = test_mode
    end

    def to_h
      {
        login: login,
        password: password,
        test_mode: test_mode
      }
    end

    def valid?
      true
    end
  end
end
