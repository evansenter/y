module Y; end

def Y(call = nil, &block)
  combinator = proc do |generator|
    proc { |function| function[function] }.call(proc do |function|
      generator.call(proc do |value|
        function[function][value]
      end)
    end)
  end.call(proc do |recurser|
    proc do |value|
      yield(recurser, value)
    end
  end)
  
  call ? combinator[call] : combinator
end
