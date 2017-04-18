# Testing

Your task is to complete the code in `your_code_here.rb` to make the existing tests in `enumerable_test.rb` to pass.

The code is for you to *reimplment* all of `Enumerable` but only using `each` -- All of Ruby's `Enumerable` features can, and likely are, implemented internally (by Matz and the other core maintainers) in terms of `each`

This will also be excellent practice in reviewing `Enumerable`

I have given you one example of `select` tests and an implementation. I have also given a `Book` class to be found in `lib/book.rb`. I have also disallowed any `Enumerable` method other than `each` - *bwahahahaha* -- after all, it is your goal to write them from scratch.

For the remainder of the tests, one at a time, *remove* the `skip` instruction from one test. Then write the code in `your_code_here` to make that pass. Try taking _small_ steps. First define the method, then start filling it in.

## Example

You will notice in the `select` example the keyword `yield` -- In this type of code the `yield` means execute the `block` of code (the stuff in the test within the `{}`) and the arguments to the yield become the arguments to the block.

Lets break down the `select` test and example.

```ruby
  it "implements select correctly" do
    short_books = [@h2g2, @pride]

    assert_equal short_books, @reimplements_enumerable.select { |book| book.page_count < 500 }
  end
```

This says that if we ask `@reimplements_enumerable` to select only the books that are less than `500` pages (e.g. `@reimplements_enumerable.select { |book| book.page_count < 500 }` we get the two books, @h2h2, and @pride. Since those books are short.

Lets look at the implementation

```ruby
  def select
    result = []

    @collection.each do |element|
      should_select = yield(element)
      if should_select
        result << element
      end
    end

    return result
  end
```

We start by making an empty array named `result`, next we use `each` to
go through the `@collection` (that represents all the elements)

While going through each element we first `yield` that element to the `block`
and see what we get back. We store that `boolean` in a variable named `should_select`

If `should_select` is true, then we put that element at the end of the array via the `<<` (shovel)
operator.

After going through all the elements we return the `result` array.

## Explorer Mode

Complete all the tests that have `skip` statements. Remove the `skip` *one at a time* until you have that test passing.
If you get stuck, put the `skip` back in and move to a different test.

## Adventure Mode

Some enumerables are noted at the bottom of the file without any tests. Write test *and* code for those.

## Epic Mode

Seak out some other enumerable methods not mentioned here (See the docs) and write tests *and* code for those.

