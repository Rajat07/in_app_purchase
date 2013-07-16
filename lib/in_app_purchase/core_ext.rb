# yaffle/lib/yaffle/core_ext.rb
require 'net/http'
Hash.class_eval do
    
    def checkSandboxReceipt
        @toSend = {
            "receipt-data" => self['receipt-data'],
            "password" => self['password']
        }.to_json
        uri = URI.parse("https://sandbox.itunes.apple.com/verifyReceipt")
        https = Net::HTTP.new(uri.host,uri.port)
        https.use_ssl = true
        https.verify_mode = OpenSSL::SSL::VERIFY_NONE
        req = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' =>'application/json'})
        req.body = "#{@toSend}"
        req.content_type = 'application/json'
        response = https.request(req)
        if response.code.eql? "200"
            JSON.parse(response)
        else
            "Fail"
        end
    end


    def checkPurchaseReceipt
        @toSend = {
            "receipt-data" => self['receipt-data'],
            "password" => self['password']
        }.to_json
        uri = URI.parse("https://buy.itunes.apple.com/verifyReceipt")
        https = Net::HTTP.new(uri.host,uri.port)
        https.use_ssl = true
        https.verify_mode = OpenSSL::SSL::VERIFY_NONE
        req = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' =>'application/json'})
        req.body = "#{@toSend}"
        req.content_type = 'application/json'
        response = https.request(req)
        if response.code.eql? "200"
            JSON.parse(response)
        else
            "Fail"
        end
    end

end