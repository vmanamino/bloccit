require 'rails_helper'
include TestFactories

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        # your expectations here
        v1 = Vote.new(value: 1)
        expect(v1.valid?).to eq(true)
        v2 = Vote.new(value: -1)
        expect(v1.valid?).to eq(true)
        v3 = Vote.new(value: 3)
        expect(v3.valid?).to eq(false)
      end
    end
  end
  
  describe 'after_save' do
    it "calls 'Post#update_rank' after save" do
      post = associated_post
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end
end

