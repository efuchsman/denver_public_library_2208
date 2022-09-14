require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do
  it 'exists' do

    dpl = Library.new("Denver Public Library")
    expect(dpl).to be_an_instance_of(Library)
  end

  it "has readable attributes" do
    dpl = Library.new("Denver Public Library")
    expect(dpl.name).to eq("Denver Public Library")

  end

  it 'can have books with authors' do
    dpl = Library.new("Denver Public Library")

    expect(dpl.books).to eq([])
    expect(dpl.authors).to eq([])

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})

    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
    expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird])



  end

  it 'can find publication timeframes for authors' do
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})

    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    dpl.publication_time_frame_for(charlotte_bronte)
    dpl.publication_time_frame_for(harper_lee)


    expect(dpl.publication_time_frame_for(charlotte_bronte)).to eq({:start => "1847", :end => "1857"})

    expect(dpl.publication_time_frame_for(harper_lee)).to eq({:start=>"1960", :end=>"1960"})

  end

  it "can checout books" do
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.checkout(mockingbird)
    dpl.checkout(jane_eyre)

    expect(dpl.checkout(mockingbird)).to be false
    expect(dpl.checkout(jane_eyre)).to be false

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    dpl.checkout(mockingbird)
    dpl.checkout(jane_eyre)

    expect(dpl.checkout(mockingbird)).to be true
    expect(dpl.checkout(jane_eyre)).to be true

  end

end
