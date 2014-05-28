describe Category do
  subject { Category.new(1.11, 2.12, 2) }
  let(:other_category) { Category.new(3.51, 1.041, 5) }

  describe "#+ - addition" do
    it "can be added to other Categorys" do
      expect(subject + other_category).to eq(Category.new(4.62, 3.161,7))
    end

    it "is unchanged when nil is added" do
      expect(subject + nil).to eq(subject)
    end
  end

  describe "#round_weight" do
    it "rounds weight up to nearest 0.05" do
      expect(subject.weight).to eq(3.25)
    end
  end

  describe "#== - equality" do
    it "returns true when weight and quantity are equal" do
      expect( subject == Category.new(1.11, 2.12, 2) ).to be_true
    end

    it "returns false when weight or quantity not equal" do
      expect( subject == other_category).to be_false
    end
  end
end
