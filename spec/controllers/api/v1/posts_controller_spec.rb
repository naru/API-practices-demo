require 'spec_helper'

describe Api::V1::PostsController do

  describe 'get index' do

    before :each do
      3.times { Factory(:post) }

      request.env['CONTENT_TYPE'] = 'application/json'
      get :index, format: 'json'
    end

    it "should respond with success" do
      response.response_code.should == 200
    end

    it "should respond with 3 records" do
      @attributes = JSON.parse(response.body)
      @attributes.count.should == 3
    end
  end

  describe 'get show' do

    describe 'if post exists' do

      before :each do
        @post = Factory(:post, content: 'tere')

        get :show, id: @post.id, format: 'json'
      end

      it "should respond with success" do
        response.response_code.should == 200
      end

      it "should respond with the post" do
        @attributes = JSON.parse(response.body)
        @returned_post = Post.find(@attributes['id'])

        @returned_post.should == @post
      end
    end

    describe "if post does not exist" do
      
      before :each do
        get :show, id: 321, format: 'json'
      end

      it "should respond with not_found" do
        response.response_code.should == 404
      end
    end

    describe "post create" do
      
      before :each do
        request.env['CONTENT_TYPE'] = 'application/json'

        attributes = { 
          post: { 
            content: 'Posted from API'
          }
        }

        request.env['RAW_POST_DATA'] = attributes.to_json

        post :create, format: 'json'

        @attributes = JSON.parse(response.body)
      end

      it "should respond with created" do
        response.response_code.should == 201
      end

      it "should respond with created post" do
        @attributes['content'].should == 'Posted from API'
      end

      it "should have only allowed attributes in response object" do
        @attributes.keys.should =~ ['id', 'content', 'updated_at']
      end
    end

  end

end
