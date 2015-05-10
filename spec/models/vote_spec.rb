require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        # your expectations here
        expect(@post.value).to eq(1).or eq(-1)
      end
    end
  end
end