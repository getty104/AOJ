require 'prime'
require 'set'
require 'tsort'
include Math
def max(a,b);              a > b ? a : b                              end
def min(a,b);              a < b ?  a : b                             end
def swap(a,b);             a, b = b, a                                end
def gif;                   gets.to_i                                  end
def gff;                   gets.to_f                                  end
def gsf;                   gets.chomp                                 end
def gi;                    gets.split.map(&:to_i)                     end
def gf;                    gets.split.map(&:to_f)                     end
def gs;                    gets.chomp.split.map(&:to_s)               end
def gc;                    gets.chomp.split('')                       end
def pr(num);               num.prime_division                         end
def digit(num);            num.to_s.length                            end
def array(s,ini=nil);      Array.new(s){ini}                          end
def darray(s1,s2,ini=nil); Array.new(s1){Array.new(s2){ini}}          end
def rep(num);              num.times{|i|yield(i)}                     end
def repl(st,en,n=1);       st.step(en,n){|i|yield(i)}                 end

class PriorityQueue
  class Element
    include Comparable

    attr_accessor :data, :priority

    def initialize(data, priority)
      @data, @priority = data, priority
    end

    def <=>(other) #最大を出したい時は入れ替える
        -@priority <=> -other.priority
    end
  end

  def initialize
    @elements = []
  end

  def push (element, priority)
    @elements << Element.new(element,priority)
  end

  def pop
    last_element_index = @elements.size - 1
    @elements.sort!
    @elements.delete_at(last_element_index)
  end
end


pqueue = PriorityQueue.new
pqueue.push "hoge",100000
pqueue.push "hoge1",1
pqueue.push "hoge2",2

p pqueue.pop.data