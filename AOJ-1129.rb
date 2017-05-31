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

ans = []
loop{
n,r = gi
break if n == 0 && r == 0
list = array n
rep n do |i|
  list[i] = n-i
end


rep r do
  l,c = gi
  d = list.slice(l-c+1,l+1)
  list.slice!(l-c+1,l+1)
  list = d + list
end
ans << list.first
}

puts ans


